class CommentLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = Comment.find(params[:comment_id])
    comment_like = CommentLike.new
    comment_like.comment = comment
    comment_like.user = current_user
    unless comment_like.save
      flash[:notice] = 'User can only like a comment once.'
    end
    redirect_to photos_path
  end
end
