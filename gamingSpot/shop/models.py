# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import User ,AbstractUser
from django.db.models.signals import post_save
from django.utils import timezone


# Create your models here.

def product_directory_path(instance, filename):
    #file will be uploaded to MEDIA_ROOT/user_<id>/<filename>
    return 'description/product_{0}/{1}'.format(instance.id, filename)

class Product(models.Model):
    name = models.CharField(max_length=50)
    CATEGORIES_OPTION=(
        ('M','Mouse'),
        ('MP','Mousepad'),
        ('K','Keyboard'),
        ('H' ,'Headset'),
        ('J' ,'Joystick'),
    )
    categories = models.CharField(max_length=50,choices=CATEGORIES_OPTION, default='Mouse')
    BRANDS_OPTION=(
        ('S','Steelseries'),
        ('R','Razor'),
        ('L','Logitech'),
        ('C','Cousair'),
    )
    brand = models.CharField(max_length=50,choices=BRANDS_OPTION, default='Steelseries')
    price = models.IntegerField()
    lates_update = models.DateTimeField()
    image = models.ImageField(upload_to = 'images/product/', default='images/product/no_img.jpg')
    #quantity = models.IntegerField(default= 0)
    description = models.TextField(default='description')
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
    date = models.DateTimeField(default=timezone.now)
    total = models.DecimalField(max_digits=7,decimal_places=2,default=0.0)
    address = models.CharField(max_length=200)
    postcode = models.CharField(max_length=5)
    product_list = models.FileField(upload_to='Order',blank=True,default='Order/no_order.xml')
    name_oncard = models.CharField(max_length=50,default='name')
    card_number = models.IntegerField(default=0000)
    MONTH_OPTION=(
        ('01','Jan'),('02','Feb'),('03','Mar'),
        ('04','Apr'),('05','May'),('06','June'),
        ('07','July'),('08','Aug'),('09','Sep'),
        ('10','Oct'),('11','Nov'),('12','Dec'),
    )
    expire_date = models.CharField(max_length=50,choices=MONTH_OPTION, default='Jan')
    MONTH_OPTION=(
        ('2016','2016'),('2017','2017'),('2018','2018'),('2019','2019'),
        ('2020','2020'),('2021','2021'),('2022','2022'),('2023','2023'),('2024','2024'),
    )
    expire_year = models.CharField(max_length=50,choices=MONTH_OPTION, default='2016')
    card_cvc = models.IntegerField(default=00)

class MyUser(AbstractUser):
    tels = models.CharField(max_length=20)
    #def __str__(self):
        #return "%s's profile" % self.user

#def create_user_profile(sender, instance, created, **kwargs):
    #if created:
        #profile, created = UserProfile.objects.get_or_create(user=instance)
#post_save.connect(create_user_profile, sender=User)
