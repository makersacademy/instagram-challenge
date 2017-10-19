class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to posts_path
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :user_id)
  end
end
