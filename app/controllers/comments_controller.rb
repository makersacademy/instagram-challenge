class CommentsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.build_with_user(comment_params, current_user)
    if @comment.save
      redirect_to '/pictures'
    else
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user.id === @comment.user_id
      @comment.destroy
      flash[:notice] = 'You have succesfully deleted your comment'
      redirect_to '/pictures'
    else
      flash[:notice] = 'You do not have permission to delete this comment'
      redirect_to '/'
    end
  end

  def comment_params
    params.require(:comment).permit(:comments)
  end
end
