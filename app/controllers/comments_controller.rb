class CommentsController < ApplicationController
  before_action :set_post, except: [:upvote]

  def create
    @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
    redirect_to posts_url
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:success] = "Comment Deleted 🥊"
    redirect_to posts_path
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
