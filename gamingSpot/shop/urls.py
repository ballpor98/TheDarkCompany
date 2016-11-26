from django.conf.urls import url
from . import views

app_name = 'shop'
urlpatterns = [
    url(r'^$', views.IndexView.as_view(), name='index'),
    url(r'^order/$',views.OrderView.as_view(), name='order'),
    url(r'^(?P<pk>[0-9]+)/$', views.DetailView.as_view(), name='detail')
]
