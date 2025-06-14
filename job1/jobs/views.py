from django.shortcuts import render
from rest_framework import viewsets, generics, permissions, parsers, status
from rest_framework.response import Response
from .models import Category, Recruitment, New, Like,Comment,User,UserProfile
from . import serializers, paginators,perms
from rest_framework.decorators import action

from .perms import IsOwner


# Create your views here.


class CategoryViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Category.objects.filter(active=True)
    serializer_class = serializers.CategorySerializer


class RecruitmentViewSet(viewsets.ViewSet, generics.ListAPIView, generics.DestroyAPIView):
    queryset = Recruitment.objects.filter(active=True).order_by('id')  # Sử dụng queryset đúng cách
    serializer_class = serializers.RecruitmentSerializer
    pagination_class = paginators.RecruitmentPagination

    def get_queryset(self):
        query = self.queryset  # Sử dụng self.queryset, không phải self.query

        q = self.request.query_params.get('q')
        if q:
            query = query.filter(subject__icontains=q)

        cate_id = self.request.query_params.get('category_id')
        if cate_id:
            query = query.filter(category_id=cate_id)

        return query

    @action(methods=['get'], url_path='news', detail=True)
    def get_news(self, request, pk):
        news = self.get_object().new_set.filter(active=True)
        return Response(serializers.NewSerializer(news, many=True).data)


class NewViewSet(viewsets.ViewSet, generics.ListAPIView, generics.RetrieveAPIView, generics.DestroyAPIView):
    queryset = New.objects.prefetch_related('tags').filter(active=True)
    serializer_class = serializers.NewDetailSerializer
    pagination_class = paginators.NewPagination  # Nếu bạn có pagination

    def get_queryset(self):
        query = self.queryset

        # Lọc theo từ khóa subject
        q = self.request.query_params.get('q')
        if q:
            query = query.filter(subject__icontains=q)

        # Lọc theo salary: min_salary và max_salary
        min_salary = self.request.query_params.get('min_salary')
        max_salary = self.request.query_params.get('max_salary')

        if min_salary:
            try:
                min_salary_value = float(min_salary)
                query = query.filter(salary__gte=min_salary_value)
            except ValueError:
                pass

        if max_salary:
            try:
                max_salary_value = float(max_salary)
                query = query.filter(salary__lte=max_salary_value)
            except ValueError:
                pass

        return query

    def get_permissions(self):
        if self.action == 'get_comments':
            if self.request.method == 'POST':
                return [permissions.IsAuthenticated()]
        elif self.action == 'like':
            return [permissions.IsAuthenticated()]

        return [permissions.AllowAny()]

    @action(methods=['get', 'post'], url_path='comments', detail=True)
    def get_comments(self, request, pk):
        if request.method == 'POST':
            serializer = serializers.CommentSerializer(data={
                'content': request.data.get('content'),
                'user': request.user.pk,
                'new': pk
            })
            serializer.is_valid(raise_exception=True)
            comment = serializer.save()
            return Response(serializers.CommentSerializer(comment).data, status=status.HTTP_201_CREATED)
        else:
            comments = self.get_object().comment_set.select_related('user').filter(active=True)
            paginator = paginators.CommentPagination()
            page = paginator.paginate_queryset(comments, request)
            if page is not None:
                serializer = serializers.CommentSerializer(page, many=True)
                return paginator.get_paginated_response(serializer.data)
            else:
                serializer = serializers.CommentSerializer(comments, many=True)
                return Response(serializer.data)

    @action(methods=['post'], url_path='like', detail=True)
    def like(self, request, pk):
        like_obj, created = Like.objects.get_or_create(user=request.user, new=self.get_object())
        if not created:
            like_obj.active = not like_obj.active
        like_obj.save()
        return Response(serializers.NewDetailSerializer(self.get_object(), context={'request': request}).data)


class CommentViewSet(viewsets.ViewSet, generics.DestroyAPIView, generics.UpdateAPIView):
    queryset = Comment.objects.filter(active = True)
    serializer_class = serializers.CommentSerializer
    permission_classes = [perms.OwnerPerms]

class UserViewSet(viewsets.ViewSet, generics.CreateAPIView):
    queryset = User.objects.filter(is_active=True)
    serializer_class = serializers.UserSerializer
    parser_classes = [parsers.MultiPartParser]
    permission_classes = [perms.OwnerPerms]

    def create(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save()
        return Response(self.serializer_class(user).data, status=status.HTTP_201_CREATED)

    @action(methods=['get', 'patch', 'delete'], url_path='current-user', detail=False,
            permission_classes=[permissions.IsAuthenticated])
    def get_user(self, request):
        u = request.user
        if request.method.__eq__('PATCH'):
            for k, v in request.data.items():
                if k in ['first_name', 'last_name']:
                    setattr(u, k, v)
                elif k == 'password':
                    u.set_password(v)
            u.save()
        return Response(serializers.UserSerializer(u).data)


class UserProfileViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.UserProfileSerialize
    permission_classes = [permissions.IsAuthenticated, IsOwner]
    # permissions.IsAuthenticated chi ap dung khi ma dang nhap ma thoi con neu muon thay doi quyen chi user khong thi phai chinh lai

    def get_queryset(self):
        # chi cho xem nhung ho so chinh minh
        # return UserProfile.objects.filter(user=self.request.user, active = True)

        # them vao de xem truy van
        if getattr(self, 'swagger_fake_view', False):
            return UserProfile.objects.none()

        if self.request.user.is_authenticated:
            return UserProfile.objects.filter(user=self.request.user, active=True)

        return UserProfile.objects.none()

    def perform_create(self, serializer):
        # Gan user cho ho so moi
        serializer.save(user=self.request.user)
