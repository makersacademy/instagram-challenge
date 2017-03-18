class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @image = Image.find(params[:image_id])
    @comment = Comment.new
  end

  def create
    @image = Image.find(params[:image_id])
    # @image.comments.create(comments_params)
    @image.comments.create(comments: comments_params["comments"],
                           image_id: params[:image_id],
                           user_id: current_user.id)
    redirect_to '/images'
  end

  private

  def comments_params
    params.require(:comment).permit(:comments)
  end

end
