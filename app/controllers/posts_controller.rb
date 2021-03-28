class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc)
  end

  def new; end

  def create
    if post_params[:image]
      post = Post.create(post_params)
      post.user_id = current_user.id
      post.save
      redirect_to posts_path
    else
      redirect_to new_post_path, notice: 'You forgot to attach an image'
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    post = Post.find_by(id: params[:id])
    post.update(post_params)
    post.save
    redirect_to posts_path
  end

  def destroy
    post = Post.find_by(id: params[:id])
    post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.permit(:caption, :image, :user_id)
  end
end
