# Procrastagram 

- The plan was to build an instagramish clone using a rails api and react front end. 
- Currently I haven't got as far as I would like but I tried to get a lot done in a short space of time, or at least if felt that way, maybe I spent to long on the responsive top nav-bar...
  
- Implementation:
  - [x] Users can register (needs some more validation and success message/errors etc)
  - [x] Users can login
  - [x] Users can logout
  - [x] Users can view posts
  - [x] Users can view individual posts
  - [x] Responsive pages
  - [x] Responsive top nav-bar
  - [x] Password encryption
  - [x] Sessions
  - [x] Fully TDD'd Api with PostgreSQL database
  - [ ] Tests all passing (Bcrypt broke my session_controller tests - needs loking at
  - [ ] Meaningfully test front end
  - [ ] Users cam make comments
  - [ ] Users cam like posts

- I've tried to keep it as package-lite as possible to learn more about React and javascipt on their own. 

- In future I may revisit something similar and make a full stack ruby-on-rails app.a
  

##  How to run it

- Clone the repo
- Run `bundle install`
- Run `npm install`
- Run `rails db:create db:migrate db:seed`
- Run `rails s`
- Go to `http://127.0.0.1:3000`
- Sign up or use the preset user `ssmith` with password `HarryPotter1`

