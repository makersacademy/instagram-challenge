class LikesController < ApplicationController

  def create
    @comment = Comment.find(params[:comment_id])
    post = @comment.post
    @comment.likes.create
    redirect_to post_path(post)
  end

end
