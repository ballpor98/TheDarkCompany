from django.conf.urls import url
from . import views

app_name = 'shopping'
urlpatterns =[
    url(r'^add/$', views.add, name='shopping-cart-add'),
    url(r'^remove/$', views.remove, name='shopping-cart-remove'),
    url(r'^show/$', views.show, name='shopping-cart-show'),
    url(r'^checkout/$', views.CheckoutView.as_view(), name='checkout'),
]
