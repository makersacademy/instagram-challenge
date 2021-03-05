class PostsController < ApplicationController


  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params["id"])
    @comments = Comment.all
  end

  def new

  end

  def create
    post_params = params["post"].permit("title", "contents", "picture", "user_id")
    post = Post.create(post_params)
    redirect_to(post_path(post))
  end

  def edit
    @post = Post.find(params["id"])
  end

  def update
    post_params = params["post"].permit("title", "contents", "picture")
    post = Post.find(params["id"])
    post.update(post_params)
    redirect_to(post_path(post))
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to(posts_path)
  end

end
