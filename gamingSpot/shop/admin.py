# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from .models import *
# Register your models here.

'''class ImageInline(admin.StackedInline):
    model = Image
    extra = 1'''

class ProductAdmin(admin.ModelAdmin):
    list_display = ('name','categories','brand','price','lates_update')
    list_filter = ['categories','brand','lates_update']
    #inlines = [ImageInline]
    list_per_page = 50
    search_fields = ['name','categories','brand',]

class OrderAdmin(admin.ModelAdmin):
    list_display = ('member_id','status','date','total','product_list')
    list_filter = ['member_id','status','date','total']
    list_per_page = 50

class UserAdmin(admin.ModelAdmin):
    list_display = ('username','first_name','last_name','email','tels')
    search_fields = ['username','first_name','last_name','email','tels']
    list_per_page = 50

admin.site.register(Product,ProductAdmin)
'''admin.site.register(Member)'''
admin.site.register(Order,OrderAdmin)
admin.site.register(MyUser,UserAdmin)
#admin.site.register(Description)