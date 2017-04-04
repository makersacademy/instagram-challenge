class CommentsController < ApplicationController

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.create_with_user(comments_params, current_user)
    if @comment.save
     respond_to do |format|
       format.html { redirect_to root_path }
       format.js
     end
    else
     flash[:alert] = "Check the comment form, something went wrong."
     render root_path
    end
  end

private

  def comments_params
    params.require(:comment).permit(:thoughts)
  end

end
