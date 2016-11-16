# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import User ,AbstractUser
from django.db.models.signals import post_save

# Create your models here.

def product_directory_path(instance, filename):
    #file will be uploaded to MEDIA_ROOT/user_<id>/<filename>
    return 'description/product_{0}/{1}'.format(instance.id, filename)

class Product(models.Model):
    name = models.CharField(max_length=50)
    brand = models.CharField(max_length=50)
    price = models.IntegerField()
    lates_update = models.DateTimeField()
    image = models.ImageField(upload_to = 'images/product/', default='images/product/no_img.jpg')
    description_file = models.FileField(upload_to=product_directory_path, default='description/no_description.txt')
    categories = models.CharField(max_length=50,default='no') 
    def __str__(self):
        return self.name
    def display_description_file(self):
        return self.description_file.read()

class Order(models.Model):
    ORDER_STATUS=(
        ('P','Pending'),
        ('A','Accepted'),
        ('W','SomeThingWrong'),
        )
    status = models.CharField(max_length=1,choices=ORDER_STATUS)
    date = models.DateTimeField()
    total = models.DecimalField(max_digits=7,decimal_places=2)
    address = models.CharField(max_length=200)
    postcode = models.CharField(max_length=5)

class MyUser(AbstractUser):
    tels = models.CharField(max_length=20)
    #def __str__(self):  
        #return "%s's profile" % self.user

#def create_user_profile(sender, instance, created, **kwargs):  
    #if created:  
        #profile, created = UserProfile.objects.get_or_create(user=instance)  
#post_save.connect(create_user_profile, sender=User) 
