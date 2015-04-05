class CommentsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def create
    post = Post.find(params[:post_id])
    new_comment = post.create_comment(current_user, comment_params)
    flash[:notice] = 'Comment Added' if new_comment.save
    redirect_to posts_path
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Comment deleted successfully'
    redirect_to '/posts'
  end

  def comment_params
    params.require(:comment).permit(:text, :user_id)
  end

end