from django.http import HttpResponse
from django.shortcuts import render,redirect
from django.views.generic import TemplateView
from django.views import generic,View
from django.core.files.base import ContentFile

import json
from carton.cart import Cart
from shop.models import *


def add(request):
    cart = Cart(request.session)
    product = Product.objects.get(id=request.GET.get('id'))
    cart.add(product, price=product.price)
    return redirect('/shopping-cart/show')


def remove(request):
    cart = Cart(request.session)
    product = Product.objects.get(id=request.GET.get('id'))
    if product in cart:
        cart.remove(product)
    return redirect('/shopping-cart/show')

def remove_single(request):
    cart = Cart(request.session)
    product = Product.objects.get(id=request.GET.get('id'))
    if product in cart:
        cart.remove_single(product)
    return redirect('/shopping-cart/show')

def show(request):
    #cart = Cart(request.session)
    return render(request, 'shopping/shopping-cart.html')

class CheckoutView(View):
    template_name = "shopping/checkout.html"

    def get(self,request):
        return render(request,self.template_name,{})

    def post(self, request):
        cart = Cart(request.session)
        o = Order(status='P',total=cart.total)
        temp = ContentFile(json.dumps(cart.cart_serializable))
        file_name = str(o.id) + ".json"
        o.product_list.save(file_name,temp)
        o.save()
        cart.clear()
        return HttpResponse(o.id)
    
