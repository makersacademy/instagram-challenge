class PostsController < ApplicationController
  def index; end

  def new; end

  def create
    new_post = Post.new post_params

    redirect_to "/users/#{session[:id]}" if new_post.save
  end

  private

  def post_params
    {
      image: params[:image],
      description: params[:description],
      user_id: session[:id],
    }
  end
end
