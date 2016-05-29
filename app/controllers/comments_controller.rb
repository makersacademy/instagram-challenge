class CommentsController < ApplicationController

  before_action :set_post
  before_action :set_comment, only: [:destroy]
  before_action :owned_post, only: [:destroy]

  def create
    comment = @post.comments.build(comment_params)
    comment.user = current_user

    if comment.save
      flash[:success] = "Congratulations, you've left a comment!"
      redirect_to :back
    else
      flash[:alert] = "Oops, comment couldn't be added."
      redirect_to :back
    end
  end

  def destroy
    if @comment.destroy
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

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def owned_post
    unless @comment.user == current_user
      flash[:alert] = "That comment doesn't belong to you!"
      redirect_to root_path
    end
  end
end
