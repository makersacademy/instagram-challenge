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
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
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
    params.require(:post).permit(:content, :image, :author)
  end
end
