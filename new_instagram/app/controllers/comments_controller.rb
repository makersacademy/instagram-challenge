class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @picture = Picture.find params[:picture_id]
  end

  def create
    comment = Comment.new(comments_params)
    comment.save

    redirect_to pictures_path
  end

  def comments_params
    params_accum = params.require(:comment).permit(:thought)
    params_accum[:picture_id] = params[:picture_id]

    params_accum
  end
end
