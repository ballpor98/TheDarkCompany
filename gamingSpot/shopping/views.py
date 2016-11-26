from django.http import HttpResponse
from django.shortcuts import render,redirect

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
    cart.remove(product)
    return HttpResponse("Removed")


def show(request):
    #cart = Cart(request.session)
    return render(request, 'shopping/shopping-cart.html')
