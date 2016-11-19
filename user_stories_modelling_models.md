As a vain user
So people can see how interesting my life is
I want to be able to upload my pictures

As a user,
So I can spy on other people's amazing lives,
I want to be able to view other people's pictures

As a social user,
So I can tell my friends I like their photos
I want to be able to comment on pictures

As a social user
So I can show my friends I am interested in their lives
I want to be able to 'like' pictures

As a user,
So I don't leave compromising images on the site,
I want to be able to delete photos

As a user,
So I can correct mistakes,
I want to be able to edit photo descriptions.

As a photographer wannabe
So I can make my photos look awesome
I want to be able to add filters to photos

**User**
email:string
full_name:string
username:string
password:string
password_confirmation:string

has many :pictures
has many :likes, through picture
has many :comments, through picture

**Picture**
belongs to :user
has many :likes
has many :comments

**Likes**
belongs to :picture

**Comments**
belongs to :picture
