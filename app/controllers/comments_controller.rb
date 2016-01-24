class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
