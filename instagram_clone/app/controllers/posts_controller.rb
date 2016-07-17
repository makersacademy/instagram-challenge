class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
   if @post.save
     flash[:success] = 'Your post has been created!'
     redirect_to posts_path
   else
     flash[:alert]= 'You need an image to post'
     render :new
   end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
      @post = Post.find params[:id]
   if @post.update(post_params)
     flash[:success] = "Post updated."
     redirect_to root_path
   else
     flash.now[:alert] = "Update failed.  Please check the form."
     render :edit
   end
 end

 def destroy
  @post = Post.find(params[:id])
  @post.destroy
  redirect_to posts_path
end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
