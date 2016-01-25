class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.build_comment comments_params, current_user
    @comment.save
    redirect_to '/posts'
  end

  private

  def comments_params
    params.require(:comment).permit(:text)
  end

end
