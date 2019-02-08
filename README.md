# Instragram Challenge #

## project ##

I am building a web app similar to Instragram, based on the following user stories :

```
As a user
So that I can create an account
I need to be able to sign up
```
```
As a user
So I can access my account
I need to be able to sign in
```
```
As a user
So I can leave my account
I need to be able to sign out
```
```
As a user
So that I can share what I am doing
I need to be able to create a new picture post
```
```
As a user
So I can change my posts
I need to be able to edit my posts
```
```
As a user
So I can remove one of my post
I need to be able delete my posts
```
```
As a user
So I can look at what others users are doing
I need to be able to view all their posts
```
## My approach ##

I choose to build a MVC diagram for the project :

![mvc diagram]()

I decided to prioritise our Minimum Viable Product by building my MVP as following :<br/>

1. User can see a list of picture from all users
2. User is able to sign_up
3. User is able to sign_out
4. User is able to sign_in
5. User can click on the link of a picture
6. User can edit posts
7. User can delete posts<br/>

The MVP has been built from this mock-up:

<!-- ![acebook-mockup](https://user-images.githubusercontent.com/43742795/52222653-ea73a480-289b-11e9-9f3a-b8ec15b4699a.png) -->

### Tech stack ###

* Ruby on rails
* Rspec/Capybara
* Html
* Css

### Code quality ###

* Rubocop - linter
* simpleCov - code coverage

## How to use ##

### Set Up ###

1. clone the repo<br/>
Under the repo name click *clone or download*<br/>
Click on *use HTTPs*, copy the clone URL of the repo<br/>
In the terminal go on the working directory where you want the cloned directory to be<br/>
Use the `git clone` command and paste the clone URL then press enter :

```shell
$ git clone https://github.com/your-username/your-repositary.git
```

2. On your local machine go inside of the *instagram-challenge* directory :

```shell
$ cd instagram-challenge
```
3. You can see the different files by using the `ls` command :<br/>

```shell
$ ls
```

4. You can open any files that you want to read and change the code in your text editor or using `vim` :

```shell
$ vim wanted_file.rb
```
Or you can just read the contains of it from the command line with `cat` :

```shell
$ cat wanted_file.html.erb
```
5. To install all the *gems* contained in the *Gemfile*, install and run *Bundle* :
Install :

```shell
$ install bundle
```
Run:

```shell
$ bundle
```
6. You can see the different directories, with the `ls` command.

### Database ###

1. If you do not have it already, install *psql* on your local machine.

2. On the command line from the root directory run the `rake` command followed by the `db:migrate` command. This will create your databases and tables in your development DB.<br/>

```shell
$ rake db:migrate
```

3. From the command line run the `rake` command followed by the `db:migrate RACK_RAILS=test` command. This will create your tables in your test DB.<br/>

```shell
$ rake db:migrate RAILS_ENV=test
```
### Run the tests ###

1. Check that the codes are passing the test. From the root *instagram-challenge* directory, run the *spec*.<br/>
You can check all the files in one go:

```shell
$ cd instagram-challenge
$ rspec
```
To check only one file at a time :

```shell
$ cd instagram-challenge
$ rspec spec/file_name_spec.rb
```

2. Check that the code respects the quality of the *Rubocop* guideline, by running `rubocop` from the *instagram-challenge* root directory :

```shell
$ cd instagram-challenge
$ rubocop
```

## Run the app ##

1. On your command line, from your root directory, use the `rails s` command to run the server :

```shell
$ rails s
```

2. Open your browser and got to the *localhost:3000* <br/>
The page will be displayed on your browser.

3. Enjoy playing around with the app as much as you want :smile:
