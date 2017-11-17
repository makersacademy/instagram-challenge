class PostsController < ApplicationController
def index
  @posts = Post.all
  @user_posts = current_user.posts
end
def new
  @post = Post.new
end
def create
  @post = current_user.posts.create(post_params)
  if @post.save
    redirect_to posts_path
  else
   render :new
  end
end

private
def post_params
  params.require(:post).permit(:caption)
end
end
