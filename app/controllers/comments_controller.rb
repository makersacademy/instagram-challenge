class CommentsController < ApplicationController
  def create
    pic = Pic.find(params[:pic_id])
    comment = pic.comments.create!(comment_params)
    redirect_to  pics_path
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
