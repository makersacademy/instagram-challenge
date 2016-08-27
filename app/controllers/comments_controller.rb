class CommentsController < ApplicationController
  def new
    @photograph = Photograph.find(params[:photograph_id])
    @comment = Comment.new
  end

  def create
    @photograph = Photograph.find(params[:photograph_id])
    @photograph.comments.create(review_params)
    redirect_to photographs_path
  end

  private

  def review_params
    params.require(:comment).permit(:thoughts)
  end
end
