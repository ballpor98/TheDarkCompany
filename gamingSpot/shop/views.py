from django.views import generic
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


class RegisterView(FormView):
    template_name = 'shop/regis.html'
    form_class = RegisterForm
    success_url = '/shop/'

    def form_valid(self, form):
        return super(RegisterView, self).form_valid(form)
