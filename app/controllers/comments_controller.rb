class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @photograph = Photograph.find(params[:photograph_id])
    @comment = Comment.new
  end

  def create
    @photograph = Photograph.find(params[:photograph_id])
    @comment = @photograph.comments.build_with_user(comment_params, current_user)
    if @comment.save
      redirect_to photograph_path(@photograph.id)
    else
      render "new"
    end
  end

  def edit
    @photograph = Photograph.find(params[:photograph_id])
    @comment = @photograph.comments.find(params[:id])
  end

  def update
    @photograph = Photograph.find(params[:photograph_id])
    @comment = @photograph.comments.find(params[:id])
    @comment.update(comment_params)
    flash[:notice] = "Your comment was updated"
    redirect_to photograph_path(@photograph.id)
  end

  def destroy
    @photograph = Photograph.find(params[:photograph_id])
    @comment = @photograph.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "Your comment was deleted successfully"
    redirect_to photograph_path(@photograph.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
