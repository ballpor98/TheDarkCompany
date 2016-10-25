# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.

class Product(models.Model):
    name = models.CharField(max_length=50)
    brand = models.CharField(max_length=50)
    price = models.IntegerField()
    lates_update = models.DateTimeField()

class Member(models.Model):
    username = models.CharField(max_length=50)
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    register_date = models.DateField()

class Order(models.Model):
    ORDER_STATUS=(
        ('P','Pending'),
        ('A','Accepted'),
        ('W','SomeThingWrong'),
    )
    status = models.CharField(max_length=1,choices=ORDER_STATUS)
    date = models.DateTimeField()
    total = models.DecimalField(max_digits=7,decimal_places=2)
    member = models.ForeignKey(Member,on_delete=models.CASCADE)
    address = models.CharField(max_length=200)
    postcode = models.CharField(max_length=5)
