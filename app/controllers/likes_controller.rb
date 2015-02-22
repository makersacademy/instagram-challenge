class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    like = @post.likes.create
    like.user_id = current_user.id
    like.save!
    redirect_to posts_path 
  end
end


