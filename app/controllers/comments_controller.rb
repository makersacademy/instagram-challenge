class CommentsController < ApplicationController

  def create
    @image = Image.find(params[:image_id])
    @image.comments.create(comment_params).set_user!(current_user)
    redirect_to "/images/#{@image.id}"
  end

  def comment_params
    params.require(:comment).permit(:content, :image)
  end
end
