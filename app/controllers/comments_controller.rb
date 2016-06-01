class CommentsController < ApplicationController


  def new
    @moment = Pic.find(params[:pic_id])
    @comment = Comment.new
  end

  def create
    @moment = Pic.find(params[:pic_id])
    @moment.comments.create(comment_params)
    redirect_to '/pics'
  end

  private

  def comment_params
    params.require(:comment).permit(:thoughts)
  end
end
