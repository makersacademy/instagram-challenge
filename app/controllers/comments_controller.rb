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
      flash[:notice] = "Comment successfully posted"
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end