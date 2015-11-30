class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to pictures_path
    else
      render 'new'
    end
  end

  def new
    picture = Picture.find(params[:picture_id])
    comment = Comment.new
  end

  def comment_params
    params.require(:comment).permit(:thoughts)
  end

end
