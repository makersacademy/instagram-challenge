class CommentsController < ApplicationController

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.new
  end

  def create
    picture = Picture.find(params[:picture_id])
    @comment = picture.build_comment(comments_params, current_user)
    @comment.save
    redirect_to root_path
  end

  private
    def comments_params
      params.require(:comment).permit(:description)
    end
end
