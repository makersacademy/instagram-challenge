class CommentsController < ApplicationController

  def new
    @image = Image.find(params[:image_id])
    @comment = @image.comments.new
  end

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.new(comment_params)

    if @comment.save
      redirect_to image_path(params[:image_id])
    else
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find (params[:id])
    @comment.destroy
    redirect_to image_path(@comment.image_id)
  end

  # def destroy
  #   @review = Review.find (params[:id])
  #   @review.destroy
  #   flash[:notice] = 'Review deleted successfully'
  #   redirect_to restaurant_path(@review.restaurant_id)
  # end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
