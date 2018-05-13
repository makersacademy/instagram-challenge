class HomeController < ApplicationController
  def index
    @post = current_user.posts.build if user_signed_in?
    @picture_feed = Post.last(25)
  end 
end
