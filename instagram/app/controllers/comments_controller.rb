class CommentsController < ApplicationController

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.build(comment_params)
    @picture.comments.create(comment_params)
  end

  def comment_params
    params.require(:comment).permit(:context)
  end

end
