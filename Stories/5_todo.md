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
- [X] Include Active Storage

      To attach file to Post
      ``` rails active_storage:install ```
      ``` rails db:migrate ```
- [X] Activae active storage on Post model

      ``` has_one_attached :image ```
      Identifies that post will have one attached image
- [X] Create a Posts controller
      
      ``` rails generate controller Posts ```
- [X] Setup resource in routes
  
      in config/routes.rb
      ``` resources :posts, only: [:new, :create] ```
- [X] Create create method

    ``` 
    def create
        Post.create(post_params)
        redirect_to root_path
      end
      
      private
      def post_params
        params.require(:post).permit(:description, :image, :user_id)
      end
    ```
    And add form to indtagram index page