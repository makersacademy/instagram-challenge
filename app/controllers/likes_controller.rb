class LikesController < ApplicationController

  def create
    @comment = Comment.find(params[:comment_id])
    post = @comment.post
    @comment.likes.create
    #render json: {new_like_count: @comment.likes.count}
    redirect_to post_path(post)
  end

end
