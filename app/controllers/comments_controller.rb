class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params)
    redirect_to(:back)
    # render json: {comments: @post.comments}
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.owned_by?(current_user)
      @comment.destroy
    else
      flash[:notice] = 'Sorry - you can only delete your own comments'
    end
    redirect_to(:back)
  end

  def comment_params
    params.require(:comment).permit(:comment).merge(user: current_user)
  end

end
