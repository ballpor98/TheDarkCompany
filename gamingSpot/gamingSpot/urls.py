"""gamingSpot URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/dev/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views 
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url,include
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth import views as auth_views
from shop import views
from django.views.generic.base import RedirectView

urlpatterns = [
    url(r'^shop/', include('shop.urls')),
    url(r'^login/$', auth_views.login, {'template_name': 'shop/login.html'}, name='login'),
    url(r'^logout/$', auth_views.logout, {'next_page': '/shop'}, name='logout'),
    url(r'^regis/$', views.RegisterView.as_view(), name='regis'),
    url(r'^contact-us-page/$', views.ContactView.as_view(), name='contact-us-page'),
    url(r'^admin/', admin.site.urls),
    url(r'^$', RedirectView.as_view(url='/shop/', permanent=False))
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

