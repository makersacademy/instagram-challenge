class CommentsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def new
    @comment = Comment.new
    @picture = Picture.find(params[:picture_id])
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.build(comment_params.merge({user: current_user}))

    if @comment.save
      redirect_to pictures_path
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    
    if current_user.comments.include?(@comment)
      @comment.destroy
      flash[:notice] = 'Comment deleted successfully'
      redirect_to '/pictures'
    else
      flash[:notice] = 'You did not add that comment'
      redirect_to '/pictures'
    end
  end

  def comment_params
    params.require(:comment).permit(:thoughts)
  end
end
