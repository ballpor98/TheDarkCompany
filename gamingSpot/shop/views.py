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
from django.db.models import Q
from django.core.files import File


import json
from .models import *
from .forms import *
from carton.cart import Cart

class IndexView(generic.ListView):
    template_name = 'shop/index.html'
    context_object_name = 'all_product'

    def get_queryset(self):
        orderd_by_lates_update = Product.objects.all().order_by('lates_update').reverse()
        return orderd_by_lates_update

class ProductView(generic.ListView):
    template_name = 'shop/product.html'
    context_object_name = 'all_product'
    def get_queryset(self):
        p_brand = self.request.GET.get('brand')
        p_categories = self.request.GET.get('categories')
        p_search = self.request.GET.get('search')
        if p_brand is None and p_categories is None and p_search is None:
            return Product.objects.all()
        elif p_brand != None:
            return Product.objects.filter(brand=p_brand)
        elif p_categories != None:
            return Product.objects.filter(categories=p_categories)
        elif p_search != None:
            searchProduct = Product.objects.filter(Q(name__contains=p_search) | Q(brand__contains=p_search) | Q(categories__contains=p_search))
            return searchProduct
        else:
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
        order = Order.objects.filter(member_id=user)
        return render(request,self.template_name,{'user':user,'order':order})

class OrderView(View):
    template_name = "shop/order.html"
    def get(self, request):
        order = Order.objects.get(id=request.GET.get('id'))
        f = open(order.product_list.path)
        myfile = f.read()
        f.close()
        myjson = json.loads(myfile)
        return render(request,self.template_name,{'order':order,'list':myjson})

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
