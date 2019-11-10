class CommentsController < ApplicationController

  def create
    p comment_params
    @comment = Comment.create(comment_params.merge(user_id: current_user.id))
    p "DONE!!!!!!!!"
    redirect_to pics_path
    # @comment.save
    # if @comment.save
    #   flash[:notice] = "Comment has been created."
    #   redirect_to pics_path
    # else
    #   flash[:alert] = "Comment has not been created."
    # end
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
      params.require(:comment).permit(:content, :pic_id)
      # params.require(:comment).permit(:comment, :authenticity_token, :id, :commit)
    end
end
