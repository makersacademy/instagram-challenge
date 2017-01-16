class CommentsController < ApplicationController

  def new
    @pun = Pun.find(params[:pun_id])
    @comment = Comment.new
  end


  def create
    @pun = Pun.find(params[:pun_id])
    @pun.comments.create(comment_params)
    redirect_to '/puns'
  end

  private

  def comment_params
    params.require(:comment).permit(:thoughts)
  end

end
