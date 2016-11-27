# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from .models import *
# Register your models here.

'''class ImageInline(admin.StackedInline):
    model = Image
    extra = 1'''

class ProductAdmin(admin.ModelAdmin):
    list_display = ('name','brand','price','lates_update')
    list_filter = ['brand','lates_update']
    #inlines = [ImageInline]

class OrderAdmin(admin.ModelAdmin):
    list_display = ('member_id','status','date','total','product_list')
    list_filter = ['member_id','status','date','total']

admin.site.register(Product,ProductAdmin)
'''admin.site.register(Member)'''
admin.site.register(Order,OrderAdmin)
admin.site.register(MyUser)
#admin.site.register(Description)