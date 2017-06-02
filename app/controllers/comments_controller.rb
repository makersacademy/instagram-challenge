class CommentsController < ApplicationController

  def new
    @turtlegram = Turtlegram.find(params[:turtlegram_id])
    @comment = Comment.new
  end

  def create
    # require'pry';binding.pry
    @turtlegram = Turtlegram.find(params[:turtlegram_id])
    @comment = @turtlegram.create_comment(comment_params, current_user)

    redirect_to "/turtlegrams/#{@turtlegram.id}"
  end

  private

  def comment_params
    params.require(:comment).permit(:thoughts)
  end

end
