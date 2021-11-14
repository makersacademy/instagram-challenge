Notes

Set up took a while
Couldn't change db of existing rails directory. Was probably typing postgres rather than postgresql
Some error with application/js and the manifest etc again. Addressed by removing reference to 
See 12:16 in the video https://www.youtube.com/watch?v=dqjF3C9A-Yg
Also had to create an application.js file
But might run into more problems shortly
Perhaps find another way to include bootstrap elements, or just do css?
Background image gradient is essential for the overall look of the site. Spent 10 mins, resources out there, couldn't get it to work in mine
Also want to modify images to be B&W before upload 
Tried the above, failed, couldn't extrapolate how to do it from the limited and obscurantist documentation
Now, the old functionality doesn't work, uploading an image
In grayscale but only in the front-end html. + and - of this
39:25, I've avoided using account names, first names, last names, to save time. I've proved the concept, so adding this stuff in is not worth the effort atm
45:00, creating a different nav bar for those logged in, separate view

Add in validation so only images can be uploaded
Do B&W by
Pre processing, only send bandw to s3
Pre processing, sending colour and band
On demand, bandw only created when needed
Post processing, changing the displayed image to bandw

The error is inlcuding this line     <%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
In application.html.erb, line 10

Some html errors in application.html.erb, lines 47/48?


User stories

As a user
So my posts can be attributed to me
I want to be able to create an account and login

As a user
So I can show my photography
I want to be able to post a picture

As a user
So I can be cool
I want all pictures to be converted to B&W automatically

As a user
So I can quickly give feedback on posts
I want to be able to like them

As a user
So I can give detailed feedback on posts
I want to be able to comment on them

As a developer
So I can make my application available remotely
I want to host it externally