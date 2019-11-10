class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment["content"]])
    @comment.save
    if @comment.save
      flash[:notice] = "Comment has been created."
      redirect_to pics_path
    else
      flash[:alert] = "Comment has not been created."
    end
  end

  # def create
  #   p params
  #   pic = Pic.find_by(id: params[:id])
  #   comment = pic.comments.build(comment_params)
  #   comment.user = current_user

  #   if comment.save
  #     flash[:notice] = "Comment has been created."
  #     redirect_to pics_path
  #   else
  #     flash[:alert] = "Comment has not been created."
  #   end
  # end

  private
    def comment_params
      new_par = params.require(:comment).permit(:content)
      p new_par
      new_par
      # params.require(:comment).permit(:comment, :authenticity_token, :id, :commit)
    end
end
