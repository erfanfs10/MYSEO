from django.db import models


class Note(models.Model):
    email = models.EmailField(max_length=255)
    message = models.TextField()

    def __str__(self):
        return self.email
