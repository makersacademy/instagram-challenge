class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    if !current_user
      redirect_to '/users/sign_in'
    else
      @comment = Comment.new
    end
  end

  def create
    @post = Post.find(params[:post_id])
    comment = @post.comments.create(comment_params)
    comment.user_id = current_user.id
    comment.save!
    redirect_to posts_path
  end

  def destroy
    @comment = Comment.find(params[:id])
    if !current_user
      flash[:notice] = "You cannot delete a comment without being logged in"
    elsif current_user.id != @comment.user_id
      flash[:notice] = "Error: You must be the author to delete a comment"
    else
      @comment.destroy
      flash[:notice] = 'Comment deleted successfully'
    end
    params.delete(:id)
    redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:thoughts)
  end

end
