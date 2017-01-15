class CommentsController < ApplicationController

  def new
    @contribution = Contribution.find(params[:contribution_id])
    @comment = Comment.new
  end

  def create
    @contribution = Contribution.find(params[:contribution_id])
    @contribution.comments.create(comment_params)
    redirect_to '/contributions'
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
