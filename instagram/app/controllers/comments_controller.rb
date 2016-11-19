class CommentsController < ApplicationController

  def new
  @post = Post.find(params[:restaurant_id])
  @comment = Comment.new
  end

end
