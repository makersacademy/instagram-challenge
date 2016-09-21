class CommentsController < ApplicationController
  def new
    @photograph = Photograph.find(params[:photograph_id])
    @comment = Comment.new
  end

  def create
    @photograph = Photograph.find(params[:photograph_id])
    @photograph.comments.create(comment_params)
    redirect_to photographs_path
  end

  def create
    @photograph = Photograph.find(params[:photograph_id])
    @comment = @photograph.comments.build_with_user(comment_params, current_user)
    if @comment.save
      redirect_to photographs_path
    else
      if @comment.errors[:user]
        redirect_to photographs_path, alert: 'You have already commented on this photograph'
      else
        render :new
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:thoughts)
  end
end
