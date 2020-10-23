class PostsController < ApplicationController
before_action :authenticate_user!


	def index
  @posts = Post.all.order("created_at DESC")
end

	def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else 
      render 'edit'
    end
  end
  
  def destroy 
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end 

  private

 def post_params
  	params.require(:post).permit(:image, :caption)
	end
end


