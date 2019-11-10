class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]

  def index
    if !current_user
      render 'devise/sessions/new'
    else
      @post = Post.new
      @post_list = Post.all.reverse
      @comment = Comment.new
    end
  end
end
