class CommentsController < ApplicationController
  def new
    @adventure = Travelgram.find(params[:travelgram_id])
    @comments = Comment.new

  end

  def create
    @adventure = Travelgram.find(params[:travelgram_id])
    @comments = @adventure.build_comment(comments_params, current_user)

    if @comments.save
      redirect_to "/travelgrams/#{@adventure.id}"
    else
      if @comments.errors[:user]
        redirect_to '/travelgrams', alert: 'You have already commented on this adventure'
      else
        render 'new'
      end
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:thoughts)
  end
end
