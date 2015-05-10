class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end  

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params)
  end

  def comment_params
    params.require(:comment).permit(:thoughts, :rating)
  end

end
