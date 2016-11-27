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
    cart.remove(product)
    return HttpResponse("Removed")


def show(request):
    #cart = Cart(request.session)
    return render(request, 'shopping/shopping-cart.html')

class CheckoutView(View):
    template_name = "shopping/checkout.html"

    def get(self,request):
        return render(request,self.template_name,{})

    def post(self, request):
        forms = {}
        for key in request.POST.keys():
            forms[key] = request.POST.get(key, '')
        cart = Cart(request.session)
        o = Order(status='P',
            total=cart.total,
            address=forms['address_line_1'],
            postcode=forms['postalcode'])
        temp = ContentFile(json.dumps(cart.cart_serializable))
        file_name = str(o.id) + ".json"
        o.product_list.save(file_name,temp)
        o.save()
        cart.clear()
        return HttpResponse(o.id)
    
