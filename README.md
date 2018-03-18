

<h2 align="center"> Pictogram </h2>
<h3 align="center"> Combining the excitement of Instagram and Pictionary in one place! </h3>

 <p align="center">  <a href='#scenario'>Scenario</a> |  <a href='#approach'>Approach</a>   |   <a href='#reflections'>Reflections</a> |
 <a href='#user_story'> User Stories</a> |  <a href='#setup'>Setup</a>   |   <a href='#tech'>Tech</a>
   

<p align="center">*Note this is a site for drawing pictures and guessing what the pictures are of.* **Not** *a site for pictogram enthusiasts. Apologies for any disappointment caused.*</p>

## Scenario <a name= "scenario"></a>

Instagram is meant to be quite good. You get to upload pictures, comment with your friends, and have a great time. But it lacks a competative element, or at least, it lacks any formal rules, so its no fun really. And as Monica from friends says 'Rules are good, they help control the fun!' An ideology that I fully subscribe to.

So here it is. Pictogram! A combination of Pictionary and Instagram. First you have to signup as a member. You then can upload your pictures (which hint to a film, book etc) or guess the answers to other members. You can add hints if you like, or let them muddle through on their own. It's up to you.

## Approach <a name= "approach"></a>

I wanted to understand rails more so I started doing a [tutorial on how to build Instagram with rails](https://www.devwalks.com/lets-build-instagram-in-rails-part-1/) (a funny coincidence). The tutorial is excellent and I would reccomend it to anyone learning rails. But I didn't want to use it as my actual project and wanted to go totally tutorial free (off the rails...) So I started the project again, using the skills I learnt but with a slightly different product to test my understanding by making me reapply these skills  in new contexts.

One big change this time, is after doing the [bowling challenge](https://github.com/Tagrand/bowling-challenge) I decided to try building one feature at a time. If you want to see my reasoning why, have a look [here](https://github.com/Tagrand/bowling-challenge#reflections). 

#### Targets

   - Build one feature at a time (I broke these down into user stories, which I then tracked. See below).
   - Add some cool functionalities that arn't on Instagram - (points for correct guesses, and user rankings) - to challenge my understanding of rails. And beat instagram.
   - Avoid overtesting, just focus on core functions and edge cases, not every scenario. This came from feedback by a Makers coach. 
   - Following the pomodoro cycle, to test out if this is a more efficient way of using my time.

## Reflections <a name= "reflections"></a>

#### With more time I would have:

- Added a way of approving right and wrong answers
- Added a points functionality when you get the right answer and ranked users
- Worked more on styling, maybe a more handwritten look (like pictures drawn in pictionary)
- Add difficulty ratings based on time unanswered (incentives attempts on old images too)


## User stories <a name= "user_story"></a>

### MVP

```
As a keen describer
So that I can show off my sick drawing skills
I want to be able to upload a picture with some helpful hints
```
- [x] Done

```
As a silly describer
So that I can fix typos/mistakes in my questions
I want to be able to change the hint and title
```
- [x] Done

```
As a keen describer
So I can feel like the site cares and remembers me
I would like to store my login
```
- [x] Done
```
As a keen owner
So that I can make sure people sign up to our site to use
I would like to prevent people from seeing anything but the pict feed if not logged in
```
- [x] Done
```
As a keen describer
So that I can get credit for my awesome drawing skills
I want my cool image to have a link to my username
```
- [x] Done
```
As a keen guesser
So that I can show of my awesome guessing skills
I want to be able to make a guess on someones picture.
```
- [ ] Done

```
As a keen guesser
So that I can show of my awesome guessing skills
I want to be able to have a link to my username when I guess.
```
- [ ] Done


## Setup <a name= "Setup"></a>

First make sure you have Rails and Ruby installed. 
1) Copy the repository and load the gems
```git clone https://github.com/Tagrand/instagram-challenge```
```bundle install```
2) Run the server 
```bin/rails server```
3) Go to localhost:3000
4) Login and Enjoy!

## Technologies used  <a name= "Technologies"></a>
  - Ruby
  - RSpec
  - HTML
  - CSS
  - Rails
  - Capybara

## Acknowledgements

Thanks to @MakersAcademy for providing the challenge, and as always, google, for continuing to listen to all my many questions.
