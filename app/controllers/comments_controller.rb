class CommentsController < ApplicationController

  def new
    @turtlegram = Turtlegram.find(params[:turtlegram_id])
    @comment = Comment.new
  end

  def create
    @turtlegram = Turtlegram.find(params[:turtlegram_id])
    @comment = @turtlegram.comments.build_with_user(comment_params, current_user)
  
    redirect_to '/turtlegrams'
  end

  private

  def comment_params
    params.require(:comment).permit(:thoughts)
  end

end
