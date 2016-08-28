class CommentsController < ApplicationController
  def new
    @mewment = Mewment.find(params[:mewment_id])
    @comment = Comment.new
  end

  def create
    @mewment = Mewment.find(params[:mewment_id])
    @mewment.comments.create(comment_params)

    redirect_to '/mewments'
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end
end
