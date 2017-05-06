class CommentsController < ApplicationController
  def new
    @adventure = Travelgram.find(params[:travelgram_id])
    @comment = Comment.new
  end

  def create
    @adventure = Travelgram.find(params[:travelgram_id])
    @adventure.comments.create(comments_params)
    require 'pry';binding.pry
    redirect_to "/travelgrams/#{@adventure.id}"
  end

  private

  def comments_params
    params.require(:comment).permit(:thoughts)
  end
end
