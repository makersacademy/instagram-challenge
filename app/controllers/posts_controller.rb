class PostsController < ApplicationController
  def index
    @posts = Post.all.reverse
  end

  # def users_posts
  #   p "*&^%$%^&*&^%%^&*&^%$£$%^&*&^%$%^&^%$%^&^%"
  #   @posts = Post.where(user_id: 1)
  #   p @posts
  # end

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

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    redirect_to '/'
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(location: params[:post][:location], description: params[:post][:description])
      redirect_to @post
    else
      render 'edit'
    end
  end

  private
  def post_params
    params.require(:post).permit(:location, :description, :photo)
  end
end
