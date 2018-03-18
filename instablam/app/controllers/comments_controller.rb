class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @params = comment_params
    @params[:user_id] = current_user.id
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.create(@params)
    redirect_to picture_path(@picture)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
