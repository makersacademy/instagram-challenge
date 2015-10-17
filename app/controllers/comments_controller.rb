class CommentsController < ApplicationController
  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.build_with_user(comment_params, current_user)
    if @comment.save
      redirect_to pictures_path
    else
      flash.now[:alert] = 'You cannot post an empty comment'
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      redirect_to pictures_path
    else
      redirect_to pictures_path
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
