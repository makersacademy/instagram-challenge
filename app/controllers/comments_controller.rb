class CommentsController < ApplicationController

  before_action :set_post

  def create
    comment = @post.comments.build(comment_params)
    comment.user = current_user

    if comment.save
      flash[:success] = "Congratulations, you've left a comment!"
      redirect_to :back
    else
      flash.now[:alert] = "Oops, comment couldn't be added."
      render root_path
    end
  end

  def destroy
    comment = @post.comments.find(params[:id])
    if comment.destroy
      flash[:success] = "Congratulations, you've deleted this comment!"
      redirect_to root_path
    else
      flash[:alert] = "Oops, comment couldn't be deleted."
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
