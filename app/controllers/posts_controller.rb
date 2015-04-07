class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all   
  end 

  def new
    @post = Post.new
  end 

  def create
    @post = Post.create(options = {:title => post_params[:title], :description => post_params[:description]} )
    if @post.save  
      flash[:notice] = 'Post added'
      redirect_to posts_path
    else
      render 'new'
    end   
  end  

  def post_params
    params.require(:post).permit(:title, :description, :image)
  end  

  def show 
    @post = Post.find(params[:id])
  end  

  def edit
    @post = Post.find(params[:id])
  end  

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to '/posts'
  end  

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post deleted successfully'
    redirect_to '/posts'
  end

  

end
