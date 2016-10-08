class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params)
    redirect_to "/posts/#{@post.id}"
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
