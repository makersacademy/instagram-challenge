

# Introduction

Welcome to the code review for the Instagram Challenge, adapted for Django! Remember, it's okay not to have all the answers. This is a scaffold for the code review process tailored to a Django-based project. Look out for common issues specific to Django, but feel free to take your own approach.

## TDD Guidance

Should you want to TDD this project, we have set out some guidelines [here on your steps yuo might want to take](./TDD_django_insta.md). Use them as guidelines not strict instructions.


# Step 0: Checkout and Run Tests

- Clone your reviewee's Django project and set up their environment.
- Run the Django tests using `python manage.py test`.
- Explore the application through the web interface.
- Consider the clarity and readability of their code, and whether the code structure is easy to understand.

# Step 1: Progress Evaluation

* Features
  * [ ] Users can post pictures
  * [ ] Users can write comments on pictures
  * [ ] Users can like a picture
  * [ ] Stylish presentation

* Bonus Features
  * [ ] Filters
  * [ ] Deployment (e.g., to Heroku)

# Step 2: Structure and Supporting Files

## Installation/Usage Instructions in README

- The README should clearly explain how to set up and use the app. This includes installation steps, running the app, and running tests. For example:

```sh
$ git clone git@github.com:[USERNAME]/django-instagram.git
$ cd django-instagram
$ pip install -r requirements.txt
$ python manage.py migrate
$ python manage.py test
```

To run the app:

```sh
$ python manage.py runserver
$ open http://localhost:8000
```

- Consider including screenshots or a demo link. Host images on platforms like Imgur or Dropbox.

## Review Your Pull Request

Before submitting, check for:
- Proper indentation
- Removal of dead code and unnecessary comments
- No unnecessary files or large binaries

# Step 3: Tests and test_*.py Files

### General Test Issues

- Avoid irrelevant or duplicated expectations. Ensure test descriptions match the test content.

### Model Tests

Use Django’s testing framework for model tests. Example:

```python
from django.test import TestCase
from .models import User

class UserModelTest(TestCase):
    def test_user_creation(self):
        user = User.objects.create_user('testuser', 'test@example.com', 'password')
        self.assertEqual(user.username, 'testuser')
```

### Feature Tests

Use Django’s `Client` class or tools like Selenium for feature tests. Prefer a declarative style:

```python
def test_user_can_comment(self):
    self.client.login(username='testuser', password='password')
    self.client.post('/comments/', {'text': 'Great picture'})
    response = self.client.get('/posts/')
    self.assertContains(response, 'Great picture')
```

### Test Precision and Context

Use Django's template context or response data to assert specific content in specific parts of the page.

### Separate Out Tests

Divide your tests into smaller, more specific tests for clarity.

# Step 4: Application Code (views.py, models.py, etc.)

## Views and Controllers

- Follow Django's MTV (Model-Template-View) pattern. Keep business logic in models and use views for handling HTTP requests.

## Models

- Follow Django ORM practices for database interactions.
- Use Django model relationships (`ForeignKey`, `ManyToManyField`, etc.) appropriately.

## Templates

- Use Django’s template language for HTML files.
- Utilize partials (`include` tag) for reusable components.

## Static Files and the Asset Pipeline

- Place images and other static files in the `static` directory.
- Use Django's static file handling to include these in your templates.

## JavaScript and AJAX

- Organize JavaScript files in the `static` directory.
- Use Django's CSRF token handling for AJAX requests.

## Routing

- Define URL patterns in `urls.py` files.
- Use Django's URL dispatcher to map URLs to views.

