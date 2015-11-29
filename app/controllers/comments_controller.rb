class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @upload = Upload.find(params[:upload_id])
    @comment = @upload.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to uploads_path
    else
      render 'new'
    end
  end

  def new
    @upload = Upload.find(params[:upload_id])
    @comment = Comment.new
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
