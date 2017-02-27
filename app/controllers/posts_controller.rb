class PostsController < ApplicationController
  
  before_action :authenticate_user!, :except => [:index, :show]
  
  include Rails.application.routes.url_helpers

  def self.default_url_options
    ActionMailer::Base.default_url_options
  end
  
  def index
    @posts = Post.order(created_at: :desc)
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      redirect_to '/posts'
    else
      render 'new'
    end
  end
  
  def like_post
    @post = Post.find(params[:id])
    @post.increment!(:likes)
    redirect_to '/posts'
  end
  
  private
  
  def post_params
    params.require(:post).permit(:picture, :picture_cache)
  end
end
