class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.create(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Posted babes <3' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:comment, :avatar)
  end

end
