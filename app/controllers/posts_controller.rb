class PostsController < ApplicationController
before_action :set_current_post, only: [:show, :edit, :update]

def index
  @posts = Post.all
  @user_posts = current_user.posts
end

def show
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

def edit
 end

 def update
   if @post.update_attributes(post_params)
     redirect_to post_path(@post)
   else
     render :edit
   end
 end

private
def post_params
  params.require(:post).permit(:caption, :image)
end
def set_current_post
  @post = Post.find(params[:id])
end
end
