#!/bin/sh
set -e

# Function to create a superuser
create_superuser() {
    echo "Creating superuser"
    python manage.py shell <<EOF
from django.contrib.auth.models import User
from django.db.utils import IntegrityError
try:
    User.objects.create_superuser(username="erfanfs10", email='test.test@gmail.com', password='Example@123')
    print("User created successfully!")
except IntegrityError:
    print("This user is already exist!")
EOF
}

sleep 5

# Run Django migrations
python manage.py makemigrations
python manage.py migrate

# Run Tests
#python manage.py test

# Call the function
create_superuser;


# Run the application.
gunicorn myseo.wsgi --bind 0.0.0.0:8000 --workers 2
