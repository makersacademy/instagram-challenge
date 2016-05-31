class CommentsController < ApplicationController

  before_action :set_post

  def create
    @comment = @post.comments.build_with_user(comment_params, current_user)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      flash[:alert] = "Comment unsuccessful. Something went wrong!"
      render root_path
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    if @comment.user.id == current_user.id
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      flash[:alert] = 'You cannot delete other user\'s comments!'
      redirect_to root_path
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
