class CommentsController < ApplicationController
  
  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create 
    @comment = Comment.new(comment_params)
    @comment.picture_id = params[:picture_id]
    @comment.save

    redirect_to '/pictures'
  end

  def comment_params
    params.require(:comment).permit(:content, :text)
  end

end
