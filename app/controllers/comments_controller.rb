class CommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    comment = Comment.create(user_id: current_user.id, post_id: post.id, body: params[:comment]['body'])
    redirect_to post_path(post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
