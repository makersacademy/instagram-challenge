class CommentsController < ApplicationController

  def new
    @photograph = Photograph.find(params[:photograph_id])
    @comment = Comment.new
  end

  def create
    @photograph = Photograph.find(params[:photograph_id])
    @photograph.comments.create(comment_params)
    redirect_to '/photographs'
  end

  private

  def comment_params
    params.require(:comment).permit(:description)
  end

end
