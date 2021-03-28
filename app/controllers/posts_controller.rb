class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc)
  end

  def new; end

  def create
    if post_params[:image]
      Post.create(post_params)
      redirect_to posts_path
    else
      redirect_to new_post_path, notice: 'You forgot to attach an image'
    end
  end

  private

  def post_params
    params.permit(:caption, :image)
  end
end
