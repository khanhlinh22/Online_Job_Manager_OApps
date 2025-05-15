from rest_framework.pagination import PageNumberPagination


class RecruitmentPagination(PageNumberPagination):
    page_size = 8


class CommentPagination(PageNumberPagination):
    page_size = 5