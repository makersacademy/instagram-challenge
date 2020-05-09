```
As a user,
So I can see photos,
I want to recently added photos on the homepage.
```

- [ ] Add posts to instagram index method

      in instagram controller add to index method
      ``` @posts = Post.order(created_at: :desc) ```
      This will display posts in reverse order
- [ ] Add posts to index view