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

Add in validation so only images can be uploaded
Do B&W by
Pre processing, only send bandw to s3
Pre processing, sending colour and band
On demand, bandw only created when needed
Post processing, changing the displayed image to bandw

The error is inlcuding this line     <%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
In application.html.erb, line 10

Some html errors in application.html.erb, lines 47/48?