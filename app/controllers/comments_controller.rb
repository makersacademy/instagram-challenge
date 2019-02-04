class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to :root
  end

  def destroy
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
