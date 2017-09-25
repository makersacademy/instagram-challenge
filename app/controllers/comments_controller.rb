class CommentsController < ApplicationController
  before_action :find_snap
  before_action :find_comment, only: [:destroy]

  def create
    @comment = @snap.comments.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    @comment.save

    if @comment.save
      redirect_to snap_path(@snap)
    else
      render 'new'
    end
  end

  def destroy
    @comment.destroy
    redirect_to snap_path(@snap)
  end

  def find_snap
    @snap = Snap.find(params[:snap_id])
  end

  def find_comment
    @comment = @snap.comments.find(params[:id])
  end
end
