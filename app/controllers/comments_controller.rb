class CommentsController < ApplicationController

  def index
    @commments = Comment.all
  end

  def create
    @user = current_user
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.create(comment_params)
    @comment.user = User.find(current_user.id)
      if @comment.save
        redirect_to @picture
      else
        flash[:notice] = @comment.errors.full_messages.join(", ")
        redirect_to '/'
      end
  end

  def new
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
