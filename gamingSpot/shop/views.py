from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.views import generic
from django.views.generic.edit import FormView

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

class RegisterView(FormView):
    template_name = 'shop/regis.html'
    form_class = RegisterForm
    success_url = '/shop/'

    def form_valid(self, form):
        return super(RegisterView, self).form_valid(form)
