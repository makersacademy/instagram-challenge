class CommentsController < ApplicationController

  #  before_action :authenticate_user! :except => [:destroy]

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.create_with_user(comments_params, current_user)
    redirect_to pictures_path
  end

  # def destroy
  #   @comment = Comment.find(params[:id])
  #   @comment.destroy
  #   if @comment.user_id == current_user.id
  #     @comment.destroy
  #   end
  #   redirect_to pictures_path
  # end

private

  def comments_params
    params.require(:comment).permit(:thoughts)
  end

end
