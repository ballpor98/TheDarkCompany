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
    search_fields = ['name', 'brand', 'category',]
    list_per_page = 50
    #inlines = [ImageInline]

admin.site.register(Product,ProductAdmin)
'''admin.site.register(Member)'''

class UserAdmin(admin.ModelAdmin):    
    list_display = ('username', 'first_name', 'last_name', 'email', 'tels')
    list_per_page = 50    
    search_fields = ['username', 'first_name', 'last_name', 'email', 'tels']    
admin.site.register(MyUser, UserAdmin)
#admin.site.register(Description)

class OrderAdmin(admin.ModelAdmin):    
    list_display = ('status', 'total', 'date')
    list_filter = ('status', 'total', 'date')
    list_per_page = 50    
    search_fields = ['status',]    
    
admin.site.register(Order, OrderAdmin)