class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post.comments.build(comment_params.merge(user_id: current_user.id))
    @post.save
    redirect_to posts_path
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
