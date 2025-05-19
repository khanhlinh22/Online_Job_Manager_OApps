from .models import Category, Recruitment, New, Tag, User,Comment, UserProfile
from rest_framework import serializers


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', 'name']

class BaseSerializer(serializers.ModelSerializer):
    def to_representation(self, instance):
        data = super().to_representation(instance)

        data['image'] = instance.image.url

        return data


class RecruitmentSerializer(BaseSerializer):

    class Meta:
        model = Recruitment
        fields = ['id', 'subject', 'scription', 'salary','created_date', 'updated_date', 'active', 'category', 'image']




class NewSerializer(BaseSerializer):
    class Meta:
        model = New
        fields = ['id', 'subject', 'created_date', 'updated_date', 'active', 'recruitment', 'image']

class TagSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tag
        fields = ['id','name']


class NewDetailSerializer(NewSerializer):
    tags  = TagSerializer(many=True)
    class Meta:
        model = NewSerializer.Meta.model
        fields = NewSerializer.Meta.fields + ['content', 'tags']

class UserSerializer(serializers.ModelSerializer):

    def create(self, validated_data):
        data = validated_data.copy()
        u = User(**data)
        u.set_password(u.password)
        u.save()
        return u

    def to_representation(self, instance):
        data = super().to_representation(instance)
        data['avatar'] = instance.avatar.url if instance.avatar else  ''
        return data

    class Meta:
        model = User
        fields = ['id','username','password','first_name', 'last_name', 'avatar']
        extra_kwargs = {
            'password' : {
                 'write_only': True
            }
        }


class CommentSerializer(serializers.ModelSerializer):
    user = UserSerializer()
    class Meta:
        model = Comment
        fields = '__all__'


class UserProfileSerialize(serializers.ModelSerializer):
    class Meta:
        model = UserProfile
        fields = ['id', 'first_name', 'last_name', 'phone', 'position', 'image']
        read_only_fields = ['user']

