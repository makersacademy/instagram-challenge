class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    if !current_user
      flash[:notice] = 'You have to be logged in to leave a comment'
      redirect_to new_user_session_path
    else
      @comment = Comment.new
    end
  end





end
