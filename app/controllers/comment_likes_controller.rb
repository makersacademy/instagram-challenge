class CommentLikesController < ApplicationController
  def create
    comment = Comment.find(params[:comment_id])
    comment_like = CommentLike.new
    comment_like.comment = comment
    comment_like.save
    redirect_to photos_path
  end
end
