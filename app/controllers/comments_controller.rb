class CommentsController < ApplicationController
  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.new(comment_params)
    if @comment.save
      redirect_to pictures_path
    else
      flash.now[:alert] = 'You cannot post an empty comment'
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find_by(picture_id: params[:picture_id], id: params[:id])
    @comment.destroy
    redirect_to pictures_path
  end


  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
