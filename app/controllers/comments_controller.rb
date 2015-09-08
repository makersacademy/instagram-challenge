class CommentsController < ApplicationController
  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @comment = @picture.comments.new(comment_params)

    if @comment.save
      redirect_to pictures_path
      flash[:notice] = "Comment successfully posted"
    else
      render 'new'
    end
  end
end
