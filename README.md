# Instagram Challenge

## MVC

MVC (Model - View - Controller) is an architectural pattern implemented in designing and building software applications. Most commonly, MVC is applied to web applications. The Rails application is split into 3 components:

- Models: Active Record is the _M_ in MVC - the layer responsible for representing business data and logic. Active Record facilitates the creation and use of business objects whose data requires persistent storage to a database.
- Views: Action View is the _V_ in MVC - the layer responsible for handling user interface objects and presentation.
- Controllers: Action Controller is the _C_ in the MVC - the layer responsible for communicating between the Model and View, it receives user input and executes commands accordingly.

### Request Response Cycle

![Request Response Cycle](public/images/rrcycle.png)

- User opens his browser, types in a URL, and presses Enter. When a user presses Enter, the browser makes a request for that URL.
- The request hits the Rails router (config/routes.rb).
- The router maps the URL to the correct controller and action to handle the request.
- The action receives the request, and asks the model to fetch data from the database.
- The model returns a list of data to the controller action.
- The controller action passes the data on to the view.
- The view renders the page as HTML.
- The controller sends the HTML back to the browser. The page loads and the user sees it.

## Instructions

- Feel free to use Google, your notes, books, etc., but work on your own
- If you refer to the solution of another coach or student, please put a link to that in your README
- If you have a partial solution, **still check in a partial solution**
- You must submit a pull request to this repo with your code by 9am Monday morning

## Task

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

## How to start

1. Produce some stories, break them down into tasks, and estimate
2. Fork this repo, clone, etc
3. Initialize a new rails project

Remember to proceed in small steps! Getting confused? Make the steps even smaller.

## Code Quality

For linting, you can use the `.rubocop.yml` in this repository (or your own!).
You'll need these gems:

```ruby
gem "rubocop", "0.79.0", require: false
gem "rubocop-rails"
```

You can also lint Javascript, CSS, and ERB — feel free to research this. These
will help you to train yourself to produce cleaner code — and will often alert
you to mistakes or mishaps!

Things to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions
