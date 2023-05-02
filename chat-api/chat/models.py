from django.db import models
from django.contrib.auth.models import AbstractBaseUser, UserManager

from django.core.validators import FileExtensionValidator

from base.services import get_path_upload_avatar, validate_size_image

from .managers import CustomUserManager

class CustomUser(AbstractBaseUser):

    SEX_CHOICES = (
    ('F', 'Female',),
    ('M', 'Male',),
    )

    name = models.CharField(max_length=30)
    surname = models.CharField(max_length=30)
    username = models.CharField(max_length=30, unique=True)
    email = models.CharField(max_length=100, unique=True, blank=True, null=True)
    phone = models.CharField(max_length=11, unique=True)
    country = models.CharField(max_length=30, blank=True, null=True)
    avatar = models.ImageField(
        upload_to=get_path_upload_avatar,
        blank=True,
        null=True,
        validators=[FileExtensionValidator(allowed_extensions=['jpg']), validate_size_image]
    )
    sex = models.CharField(max_length=1, blank=True, choices=SEX_CHOICES)
    date_created = models.DateField(auto_now_add=True)
    online = models.BooleanField(null=False, blank=False, default=False)
    is_admin = models.BooleanField(null=False, blank=False, default=False)
    
    objects = CustomUserManager()

    REQUIRED_FIELDS = ['name', 'surname', 'username', 'avatar']
    USERNAME_FIELD = 'phone'

    @property
    def is_authenticated(self):
        return True
    
    @property
    def is_staff(self):
        return self.is_admin
    
    def has_perm(self, perm, obj=None):
        return self.is_admin

    def has_module_perms(self, app_label):
        return self.is_admin

    def __str__(self) -> str:
        return self.phone
    
    class Meta:
        db_table = u'chat_user'
        verbose_name = u'Users'
        verbose_name_plural = u'Users'


class Message(models.Model):
    sender_id = models.ForeignKey(CustomUser,  on_delete=models.CASCADE, related_name='sender')
    conversation_id = models.ForeignKey('Conversation', on_delete=models.CASCADE)
    content = models.TextField(max_length=4096)
    time_created = models.DateTimeField(auto_now_add=True)
    is_read = models.BooleanField(default=False)
    
    def __str__(self) -> str:
        return self.content[:50]
    

class Conversation(models.Model):
    creator_id = models.ForeignKey(CustomUser, on_delete=models.CASCADE, related_name='creator')
    adapter_id = models.ForeignKey(CustomUser, on_delete=models.CASCADE, related_name='adapter')
    time_created = models.DateTimeField(auto_now_add=True)
    deleted = models.BooleanField(default=False)
    
    def __str__(self) -> str:
        return str(self.creator_id) + " " + str(self.adapter_id)

