class LikesController < ApplicationController

  def create
    @comment = Comment.find(params[:comment_id])
    @comment.likes.create
    redirect_to pictures_path
  end

end
