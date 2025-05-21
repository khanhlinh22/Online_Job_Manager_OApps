from django.contrib import admin
from django.db.models import Count
from django.template.response import TemplateResponse
from .models import Category, Recruitment, New, Tag, Like,Comment,User,UserProfile
from django.utils.html import  mark_safe
from django import forms
from ckeditor_uploader.widgets import   CKEditorUploadingWidget
from django.urls import path

# Register your models here.


class MyRecruitmentAdmin(admin.AdminSite):
    site_header = 'oJob Company'

    def get_urls(self):
        return [path('recruitment-stats/', self.stats)] + super().get_urls()

    def stats(self, request):
        stats = Category.objects.annotate(count=Count('recruitment__id')).values('id', 'name', 'count')
        return TemplateResponse(request, 'admin/stats.html', {
            'stats': stats
        })


class NewForm(forms.ModelForm):
    content = forms.CharField(widget=CKEditorUploadingWidget)
    class Meta:
        model = New
        fields = '__all__'

class NewAdmin(admin.ModelAdmin):
    list_display = ['id', 'subject', 'active', 'created_date', 'recruitment']
    search_fields = ['subject']
    list_filter = ['id', 'subject', 'created_date']
    readonly_fields = ['avatar']
    form = NewForm

    def avatar(self, new):
        if new.image:
            return mark_safe(f"<img src='/static{new.image.name}' width='120'")
        return "No image"


    # class Media:
    #     css = {
    #         'all':('/static/css/style.css',)
    #     }

admin_site = MyRecruitmentAdmin(name='oJob')

admin_site.register(Category)
admin_site.register(Recruitment)
admin_site.register(New,NewAdmin)
admin_site.register(Tag)
admin_site.register(Like)
admin_site.register(Comment)
admin_site.register(User)
admin_site.register(UserProfile)



