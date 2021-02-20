class CommentsController < ApplicationController
  def new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to '/pictures'
    else
      render '/pictures'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:text, :picture_id, :user_id)
    end
end
