class CommentsController < ApplicationController
  before_action :find_post

  def index
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = "Your comment has been created!"
      redirect_to @post
    else
      flash.now[:alert] = "Your comment couldn't be created!  Please check the form."
      render root_path
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:success] = "Comment has been deleted!"
    redirect_to root_path
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
