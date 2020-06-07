# Instagram Clone

This is my clone of Instagram, using Rails. It is deployed on Heroku at:

https://patricks-instagram.herokuapp.com/dashboard

It allows users to signup, add posts, add descriptions, view posts, like posts, and edit their profile including uploading a profile picture and a blurb. 

## Approach

I was very new to rails when I did this so I followed these videos on YouTube. I almost followed him completely, however there were many occaisions where the code didn't behave as expected so I had to figure bits out myself.

https://www.youtube.com/watch?v=dqjF3C9A-Yg
https://www.youtube.com/watch?v=yhg7hd3ogJ8

Photos are saved in an S3 Bucket on Amazon. I used the ruby gems Carrierwave and Fog to deal with this. My AWS credentials are in a file I have put in the .gitignore, and I saved them as Environment Variables on Heroku. I also had to stop the AWS code working when in a test environment for Travis to pass.

I spent a long time making sure it passed Travis tests and deployed to Heroku each time I pushed to github. I really wanted a live website at the end of this challenge so it was worth the effort. I had many issues along the way but somehow ironed them out. 

I also used Bootstrap for CSS. There is a small amount of JavaScript to update the 'likes' info.

I considered this project more of an exploration of rails as I am completely new to the framework, so I haven't dont any TDD for this project.