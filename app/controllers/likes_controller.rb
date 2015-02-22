class LikesController < ApplicationController

  def create
    if !current_user
      redirect_to new_user_session_path
    else
      @post = Post.find(params[:post_id])
      like = @post.likes.create
      like.user_id = current_user.id
      like.save!
      redirect_to posts_path 
    end
  end
end


