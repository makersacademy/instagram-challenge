class CommentsController < ApplicationController

  def create
    if current_user
      @gram = Gram.find(params[:gram_id])
      @comment = @gram.comments.new(comment_params)
      @comment.user_id = current_user.id
      if @comment.save
        flash[:notice] = "Comment successfully added"
        redirect_to @gram
      else
        render 'new'
      end
    else
      flash[:alert] = "You must be signed in"
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end
