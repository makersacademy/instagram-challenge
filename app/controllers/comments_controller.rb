class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comments_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:notice] = "You commented the hell out of that post!"
      redirect_to :back
    else
      flash[:alert] = "Check the comment form, something went horribly wrong."
      render root_path
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment deleted :("
    redirect_to root_path
  end

  private

  def comments_params
    params.require(:comment).permit(:comment)
  end
end
