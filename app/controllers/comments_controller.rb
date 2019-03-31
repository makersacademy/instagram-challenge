class CommentsController < ApplicationController

  def create
    p "COMMENT: #{params[:comment]['body']}"
    post = Post.find(params[:post_id])
    # comment = post.comments.create(comment_params)
    comment = Comment.create(user_id: current_user.id, post_id: post.id, body: params[:comment]['body'])
    comment.save
    redirect_to post_path(post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
