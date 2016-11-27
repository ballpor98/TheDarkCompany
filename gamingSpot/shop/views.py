from django.shortcuts import get_object_or_404, render,redirect
from django.http import HttpResponseRedirect,HttpResponse
from django.urls import reverse
from django.views import generic,View
from django.views.generic.edit import FormView
from django.views.generic import TemplateView
from django.db import connection, IntegrityError
from django.contrib import messages
from django.core import serializers
from django.core.files.base import ContentFile
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator

import json
from .models import *
from .forms import *
from carton.cart import Cart

class IndexView(generic.ListView):
    template_name = 'shop/index.html'
    context_object_name = 'all_product'

    def get_queryset(self):
        return Product.objects.all()

class ProductView(generic.ListView):
    template_name = 'shop/product.html'
    context_object_name = 'all_product'

    def get_queryset(self):
        return Product.objects.all()


class DetailView(generic.DetailView):
    model = Product
    template_name = 'shop/detail.html'

class ContactView(TemplateView):
    model = Product
    template_name = "shop/contact-us-page.html"

class MemberView(View):
    template_name = "shop/member.html"

    @method_decorator(login_required)
    def get(self, request):
        user = MyUser.objects.get(id=request.user.id)
        return render(request,self.template_name,{'user':user})

class OrderView(View):
    template_name = "shop/order.html"
    def get(self, request):
        cart = Cart(request.session)
        o = Order(status='P',total=cart.total)
        #data = cart.items_serializable
        temp = ContentFile(json.dumps(cart.cart_serializable))
        file_name = str(o.id) + ".json"
        o.product_list.save(file_name,temp)
        o.save()
        #product_list=json.dumps(cart.cart_serializable())
        cart.clear()
        return HttpResponse(o.id)

class RegisterView(View):
    template_name = 'shop/regis.html'
    # success_url = '/shop/'

    #def form_valid(self, form):
    def get(self, request):
        return render(request, self.template_name, {})
        #return redirect('/login')

    def post(self, request):
        forms = {}
        for key in request.POST.keys():
            forms[key] = request.POST.get(key, '')
        try:
            newuser = MyUser(is_superuser=0,
                        username=forms['display_name'],
                        first_name=forms['first_name'],
                        last_name=forms['last_name'],
                        email=forms['email'],
                        tels=forms['tel'])
            newuser.set_password(forms['password'])
            newuser.save()
            return redirect('/login')
        except IntegrityError as e:
            messages.error(request, 'Useranme already exists', extra_tags='alert-danger')
            return render(request, self.template_name, forms)
