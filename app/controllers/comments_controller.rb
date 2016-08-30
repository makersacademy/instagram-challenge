class CommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :comment_owner, only: [:edit, :destroy]

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build_with_user(comment_params, current_user)
    if @comment.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    if @comment.save
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Comment deleted successfully'
    redirect_to posts_path
  end

  private

  def comment_owner
    @comment = Comment.find(params[:id])
    unless @comment.user_id == current_user.id
      flash[:notice] = 'You did not create this comment'
      redirect_to posts_path
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
