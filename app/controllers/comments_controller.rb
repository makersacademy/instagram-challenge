class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id].to_i)
    @comment = @post.build_comment comment_params, current_user
    if @post.save
      redirect_to posts_path
    else
       @post.errors[:user]
       redirect_to posts_path, alert: 'Comment failed'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:thoughts)
  end
end
