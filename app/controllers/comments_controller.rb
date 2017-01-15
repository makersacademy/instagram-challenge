class CommentsController < ApplicationController

  def new
    @photograph = Photograph.find(params[:photograph_id])
    @comment = Comment.new
  end

  def create
    @photograph = Photograph.find(params[:photograph_id])
    @comment = @photograph.comments.build_with_user(comment_params, current_user)

    if @comment.save
      redirect_to photographs_path
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description)
  end

end
