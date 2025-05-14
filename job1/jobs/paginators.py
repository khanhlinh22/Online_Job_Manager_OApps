from rest_framework.pagination import PageNumberPagination


class RecruitmentPagination(PageNumberPagination):
    page_size = 3


class CommentPagination(PageNumberPagination):
    page_size = 5