class CommentsController < ApplicationController

  def create
    #@image = Image.find(params[:comment][:image_id])
    @comment = Comment.create(comment_params)
    redirect_to images_path
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :image_id)
  end

end
