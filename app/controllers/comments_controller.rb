class CommentsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to "/pictures/#{params[:picture_id]}?id=#{params[:picture_id]}"
  end


  def destroy
    @comment = Comment.find(params[:id])
    unless @comment.belongs_to?(current_user)
      flash[:alert] = "Naughty! You can only delete your own pictures!"
      redirect_to "/pictures"
    end
    @comment.destroy
    flash[:notice] = "Comment deleted succesfully"
    redirect_to '/pictures'
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
