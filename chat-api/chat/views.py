from django.shortcuts import get_object_or_404, render
from rest_framework import generics, viewsets, mixins, parsers, permissions
from rest_framework.views import APIView
from rest_framework.parsers import JSONParser
from django.http.response import JsonResponse
from rest_framework.response import Response
from rest_framework.viewsets import GenericViewSet
from rest_framework.decorators import action, api_view, permission_classes
from django.forms import model_to_dict
from rest_framework.permissions import AllowAny, IsAuthenticated

from .models import CustomUser, Message, Conversation
from .serializers import CustomUserSerializer, MessageSerializer, ConversationSerializer, FindUserBySerializer


class CustomUserViewSet(mixins.CreateModelMixin,
                   mixins.RetrieveModelMixin,
                   mixins.UpdateModelMixin,
                   mixins.ListModelMixin,
                   GenericViewSet):
    serializer_class = CustomUserSerializer
    

    def get_queryset(self, pk=None):
        phone = self.request.query_params.get('phone')
        if phone:
            return self.get_user_by_phone(phone)
        if pk:
            return CustomUser.objects.filter(pk=pk)
        if not pk:
            pk = self.kwargs.get('pk')
        return CustomUser.objects.all()
    
    def post(self, request):
        serializer = CustomUserSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({'post': serializer.data})
    
    @permission_classes([IsAuthenticated])
    def get_user_by_phone(self, phone):
        return CustomUser.objects.filter(phone=phone)
    
class MessageViewSet(mixins.CreateModelMixin,
                   mixins.RetrieveModelMixin,
                   mixins.UpdateModelMixin,
                   mixins.ListModelMixin,
                   GenericViewSet):
    serializer_class = MessageSerializer

    def get_queryset(self):
        pk = self.kwargs.get('pk')
        if pk:
            return Message.objects.filter(pk=pk)
        return Message.objects.all()
    
    def post(self, request):
        serializer = MessageSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({'post': serializer.data})
    

class ConversationViewSet(mixins.CreateModelMixin,
                   mixins.RetrieveModelMixin,
                   mixins.UpdateModelMixin,
                   mixins.ListModelMixin,
                   GenericViewSet):
    serializer_class = ConversationSerializer

    def get_queryset(self):
        pk = self.kwargs.get('pk')
        if pk:
            return Conversation.objects.filter(pk=pk)
        return Conversation.objects.all()
    
    def post(self, request):
        serializer = ConversationSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({'post': serializer.data})
    

class   FindUserViewSet(mixins.CreateModelMixin,
                   mixins.RetrieveModelMixin,
                   mixins.UpdateModelMixin,
                   mixins.ListModelMixin,
                   GenericViewSet):
    serializer_class = FindUserBySerializer
    permission_classes = [AllowAny]
    http_method_names = ['get']
    

    def get_queryset(self,):
        id = self.request.query_params.get('id')
        username = self.request.query_params.get('username')
        phone = self.request.query_params.get('phone')
        if id:
            return CustomUser.objects.filter(id=id)
        if username:
            return CustomUser.objects.filter(username=username)
        if phone:
            return CustomUser.objects.filter(phone=phone)
        return None
        
