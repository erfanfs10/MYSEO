from django.urls import path
from .views import cv


urlpatterns = [
    path("", cv, name="cv")
]
