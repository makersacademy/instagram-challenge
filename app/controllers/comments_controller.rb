class CommentsController < ApplicationController

  before_action :set_post

  def create
    @comment = @post.comments.build_with_user(comment_params, current_user)
    if @comment.save
      flash[:success] = 'You have successfully commented!'
      redirect_to :back
    else
      flash[:alert] = "Comment unsuccessful. Something went wrong!"
      render root_path
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    if @comment.user_id == current_user.user_id
      @comment.destroy
      flash[:success] = 'Comment deleted successfully!'
      redirect_to root_path
    else
      flash[:alert] = 'You cannot delete other user\'s comments!'

    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
