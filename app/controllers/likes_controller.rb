class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    if !current_user
      redirect_to new_user_session_path
    elsif current_user.has_liked?(@post)
      flash[:notice] = 'You have already liked this post'
      redirect_to posts_path
    else
      like = @post.likes.create
      like.user_id = current_user.id
      like.save!
      redirect_to posts_path 
    end
  end
end


