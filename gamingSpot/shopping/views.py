from django.http import HttpResponse
from django.shortcuts import render,redirect
from django.views.generic import TemplateView

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


def show(request):
    #cart = Cart(request.session)
    return render(request, 'shopping/shopping-cart.html')

class CheckoutView(TemplateView):
    template_name = "shopping/checkout.html"
    
