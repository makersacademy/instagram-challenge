class CommentsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.build_comment(comment_params, current_user)
    if @comment.save
      redirect_to picture_path(@picture)
    else
      render :new
    end
  end

private

  def comment_params
    params.require(:comment).permit(:comment_text, :picture_id, :user_id)
  end
end
