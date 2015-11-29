class CommentsController < ApplicationController
  def new
    @filterspam = Filterspam.find(params[:filterspam_id])
    @comment = Comment.new
  end

  def create
    @filterspam = Filterspam.find(params[:filterspam_id])
    @comment = Comment.new(_comment_params)
    @comment.filterspam = @filterspam
    if @comment.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  def _comment_params
    params.require(:comment).permit(:comment)
  end
end
