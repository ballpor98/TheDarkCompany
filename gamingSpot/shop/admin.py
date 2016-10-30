# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from .models import *
# Register your models here.

class ProductAdmin(admin.ModelAdmin):
    list_display = ('name','brand','price','lates_update')
    list_filter = ['brand','lates_update']


admin.site.register(Product,ProductAdmin)
'''admin.site.register(Member)'''
admin.site.register(Order)
