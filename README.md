Visit http://instagram-clone-makers-ohm.herokuapp.com/

Or to visit the website through a local server:
- clone this repo
- navigate to instagram_clone in the command line
- install the necessary gems with bundle install
- run the following commands to create and migrate to a database and start the server:
	1. bin/rake db:create
	2. bin/rake db:migrate
	3. bin/rails s
- visit localhost:3000 in your browser

Functionality:
- sign up
- post images
- comment on posts
- like posts
- follow other users to get only their posts in your feed

Issues:

* devise threw an error when I tried to refactor signing-in/signing-up from feature tests into helper methods. The error was:
``` undefined method `visit' for #<Devise::ParameterSanitizer ```
This error occurred even when I didn't use the helper method in feature tests - and there are no problems when I moved the contents of the helper method into the feature test, and no problems with other helper methods not using sign-in/sign-out

* one test still fails even though in the browser the feature is working. Clicking like more than once should (and does) throw up an error message, but clicking like more than once in the feature test doesn't throw up that error.

* I couldn't work out how to create a post with an image directly inside a unit test - rather than through capybara clicks. Whatever file path I specified as the image it wouldn't locate it. I'm not actually sure how an image is stored within the post object.
