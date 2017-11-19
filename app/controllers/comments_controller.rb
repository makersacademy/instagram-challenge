class CommentsController < ApplicationController

  before_action :find_picture

  def create
  @comment = @picture.comments.create(params[:comment].permit(:content))
  @comment.user_id = current_user.id
  @comment.save
    if @comment.save
      redirect_to picture_path(@picture)
    else
      render 'new'
    end
  end

  private

  def find_picture
    @picture = Picture.find(params[:picture_id])
  end

end
