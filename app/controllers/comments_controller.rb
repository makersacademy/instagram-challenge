class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(user_id: current_user.id, body: comment_params[:body])
    redirect_to @post
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
