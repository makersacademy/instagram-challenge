class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def users_posts

    @posts = Post.where(user_id: 1)

  end

  def new
    @post = Post.new
 
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      PhotoUploader.new.store!(params[:post][:photo])
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end


  private
    def post_params
      params.require(:post).permit(:location, :description, :photo)
    end


end
