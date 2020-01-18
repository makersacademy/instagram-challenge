class PostsController < ApplicationController
  def index; end

  def new; end

  def create
    new_post = Post.new post_params

    redirect_to "/users/#{session[:id]}" if new_post.save
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    post = Post.find params[:id]
    post.update({ description: params[:description] })
    redirect_to "/users/#{session[:id]}"
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
