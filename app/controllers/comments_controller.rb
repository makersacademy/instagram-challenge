class CommentsController < ApplicationController

  before_action :find_picture
  before_action :find_comment, only: [:destroy, :edit, :update, :comment_owner]
  before_action :comment_owner, only: [:destroy, :edit, :update]

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

  def destroy
    @comment.destroy
    redirect_to picture_path(@picture)
  end

  def edit
  end

  def update
    if @comment.update(params[:comment].permit(:content))
      redirect_to picture_path(@picture)
    else
      render 'edit'
    end
  end

  private

  def find_picture
    @picture = Picture.find(params[:picture_id])
  end

  def find_comment
    @comment = @picture.comments.find(params[:id])
  end

  def comment_owner
    unless current_user.id == @comment.user_id
      flash[:notice] = "You cannot do that!"
      redirect_to @picture
    end
  end

end
