class PostsController < ApplicationController
  
  before_action :authenticate_user!, :except => [:index, :show]
  
  include Rails.application.routes.url_helpers

  def self.default_url_options
    ActionMailer::Base.default_url_options
  end
  
  def index
    @posts = Post.all
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
  
  def post_params
    params.require(:post).permit(:picture)
  end
end
