class CommentsController < ApplicationController
  before_action :set_post
  
  def create
    @comment = @pin.comments.new(comment_params)
    @comment.user_id = current_user.id
  
    if @comment.save
      redirect_to @pin
    else
      render root_path
    end
  end

  def destroy
    @comment = @pin.comments.find(params[:id])
  
    @comment.destroy
    redirect_to @pin
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end
  
  def set_post
    @pin = Pin.find(params[:pin_id])
  end
  
end
