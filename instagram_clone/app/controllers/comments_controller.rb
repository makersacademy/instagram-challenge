class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @contribution = Contribution.find(params[:contribution_id])
    @comment = Comment.new
  end

  def create
    @user = current_user
    @contribution = Contribution.find(params[:contribution_id])
    comment = @contribution.comments.create_with_user(comment_params, @user)
    redirect_to '/contributions'
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
