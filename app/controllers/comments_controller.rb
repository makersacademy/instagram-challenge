class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params)
    if @post.save
      redirect_to posts_path
    else
       @post.errors[:user]
    redirect_to posts_path, alert: 'Comment failed'
    end
  end

  def comment_params
    params.require(:comment).permit(:thoughts)
  end
end
