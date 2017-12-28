class CommentsController < ApplicationController
  def new
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "Comment created successfully."
      b= "/pictures/id.#{params[:picture_id]}"
      redirect_to (b)

    else
      flash[:alert] = "Check your comment, something went wrong"
      render('new')
    end
  end

  def destroy
    @comment = @picture.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment has been deleted."
    redirect_to root_path
  end

  private
  def comment_params
   params.require(:comment).permit(:content)
 end
end
