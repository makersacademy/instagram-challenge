Instructions

This is an instagram clone. The task description can be found in READMEmakers.md. I decided to come up with a USP, automatically converting uploaded images to grayscale. This allowed me to extend the functionality and start thinking about the business aspects of app design.

Project is best viewed as the raw code (see comment 6 below). A video demo can be found here https://youtu.be/GDJx7PdG_X0.

I didn't have time to implement feature or unit tests. This doesn't form a user story but it's an important skill to practice and is my priority going forward.

User stories

1
As a user
So my posts can be attributed to me
I want to be able to create an account and login
(Achieved, but there's a bug with logging out)

2
As a user
So I can show my photography
I want to be able to post a picture
(Achieved)

3
As a user
So I can be cool
I want all pictures to be converted to B&W automatically
(Achieved, but poorly implemented, see below)

4
As a user
So I can quickly give feedback on posts
I want to be able to like them
(Not achieved)

5
As a user
So I can give detailed feedback on posts
I want to be able to comment on them
(Achieved)

6
As a developer
So I can make my application available remotely
I want to host it externally
(Not Achieved)

Comments on user stories

1 - As above

2 - As above

3 - Images would ideally be converted to black and white (B&W) by pre-processing them, ie taking the upload, converting to B&W by the server, then being sent to the S3 bucket. This would reduced storage costs. Another option would be storing the uploaded image and carrying about ad-hoc modifications to each image as requested. I didn't have time to implement these, so grayscale is achieved by creating a web-site wide grayscale setting for all images on my website.

4 - I didn't have time to implement this. Actual implementation should recognise that users should only be able to like a post once, and the author of a post shouldn't be able to like their post.

5 - There is a lot more work I could do to make the posts and commments clearer defined.

6 - Not enough time to explore external hosting. As I've used an S3 bucket for storing images, which requires access keys, the storage part of the demo won't work unless the reviewer also has access keys to an S3 bucket.


