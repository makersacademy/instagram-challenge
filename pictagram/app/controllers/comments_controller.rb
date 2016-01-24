class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build_with_user(comment_params(params[:post_id]),current_user)
    if @comment.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

def comment_params(post_id)
    params.require(:comment).permit(:comment, post_id)
  end

end
