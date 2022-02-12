class PostsController < ApplicationController

  # GET
  def index
    @posts = Post.all
  end

  # GET
  def new
    @post = Post.new
  end

  # POST
  def create
    Post.create(post_params)
    redirect_to posts_path
  end


  # def show
    
  # end

  # def edit
    
  # end


  # def destroy
    
  # end

  # def update
    
  # end

  private

  def post_params
    params.require(:post).permit(:content, :image)
  end
end
