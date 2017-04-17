class CommentLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = Comment.find(params[:comment_id])
    comment_like = comment.comment_likes.build(user: current_user)
    flash[:notice] = 'User can only like a comment once.' unless comment_like.save
    redirect_to photos_path
  end
end
