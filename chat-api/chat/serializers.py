from rest_framework import serializers
from rest_framework.renderers import JSONRenderer
from rest_framework.parsers import JSONParser

import io

from .models import CustomUser, Message, Conversation
from .managers import CustomUserManager


class CustomUserSerializer(serializers.ModelSerializer):

    def create(self, *args, **kwargs):
        user = super().create(*args, **kwargs)
        password = user.password
        user.set_password(password)
        user.save()
        return user

    def update(self, *args, **kwargs):
        user = super().update(*args, **kwargs)
        password = user.password
        user.set_password(password)
        user.save()
        return user
    
    class Meta:
        model = CustomUser
        fields = ('id', 'username', 'name', 'surname', 'phone', 'avatar' )


class MessageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Message
        fields = "__all__"

    
class ConversationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Conversation
        fields = "__all__"

    def validate(self, data):
        if data['creator_id'] == data['adapter_id']:
            raise serializers.ValidationError("You cant message yourself")
        
        if Conversation.objects.filter(
                creator_id=data['creator_id'], adapter_id=data['adapter_id']):
            raise serializers.ValidationError("Conversation already exisits")
        
        return data
    
class FindUserBySerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ('id', 'username', 'phone')
