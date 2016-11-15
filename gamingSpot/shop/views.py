from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.views import generic,View
from django.views.generic.edit import FormView
from django.views.generic import TemplateView

from .models import *
from .forms import *


class IndexView(generic.ListView):
    template_name = 'shop/index.html'
    context_object_name = 'all_product'

    def get_queryset(self):
        return Product.objects.all()


class DetailView(generic.DetailView):
    model = Product
    template_name = 'shop/detail.html'

class ContactView(TemplateView):
    model = Product
    template_name = "shop/contact-us-page.html"

class RegisterView(View):
    template_name = 'shop/regis.html'
    # success_url = '/shop/'

    #def form_valid(self, form):
    def get(self, request):
        return render(request, self.template_name, {})

    def post(self, request):
        forms = {}
        for key in request.POST.keys():
            forms[key] = request.POST.get(key, '')
        newuser = MyUser(is_superuser=0,
                    username=forms['display_name'],
                    first_name=forms['first_name'],
                    last_name=forms['last_name'],
                    email=forms['email'])
        newuser.set_password(forms['password'])
        newuser.save()
        #return redirect('/shop')

        return render(request, self.template_name, forms)
