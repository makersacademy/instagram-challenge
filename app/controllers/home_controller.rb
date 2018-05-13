class HomeController < ApplicationController
  def index
    @post = current_user.posts.build if user_signed_in?
    @picture_feed = Post.last(25)
    @comment = @picture_feed[0].comments.build if @picture_feed[0]
  end 
end
