class PostsController < ApplicationController

  def index
    @posts= Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to '/posts'
  end

  def destroy
     @post = Post.find(params[:id])
     @post.destroy
     flash[:notice] = 'Post deleted successfully'
     redirect_to '/posts'
   end



  private

  def post_params
    params.require(:post).permit(:image, :description)
  end

end
