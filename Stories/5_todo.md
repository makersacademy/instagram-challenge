```
As a user,
So that I can show the world my photos,
I want to be able to post a photo when logged in.
```

Post should have:
  Image
  Caption
  User
Posts Should not:
  Be created when user is logged out

- [X] Create a Posts model
  - [X] description - string
  - [X] user_id - integer
  - 
    ``` rails generate model Post description:string user_id:integer ```
    ``` rails db:migrate ```
- [ X Connect Users and posts
      in models/user.rb
      ``` has_many :posts, dependent: :destroy ```
      dependent - destroy means all user posts will be deleted if the user is deleted

      in models/post.rb
      ``` belongs_to :user ```
- [ ] Include Active Storage
- [ ] Create a Posts controller