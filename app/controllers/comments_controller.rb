class CommentsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def new
    @image = Image.find(params[:image_id])
    @comment = Comment.new
  end

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.build_with_user(comment_params, current_user)
    if @comment.save
      redirect_to images_path
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user.id === @comment.user_id
      @comment.destroy
      flash[:notice] = 'You have succesfully deleted your comment'
      redirect_to images_path
    else
      flash[:notice] = 'You do not have permission to delete this comment'
      redirect_to images_path
    end
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
