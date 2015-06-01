class CommentsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    user = User.find(current_user.id)
    @post = user.posts.find(params[:post_id])
    user_id = {user_id: current_user.id}
    new_params = comment_params.merge!(user_id)
    @post.comments.create(new_params)
    redirect_to '/posts'
  end

  def comment_params
    params.require(:comment).permit(:thoughts)
  end

  def destroy
    @comment = Comment.find(params[:id])
    # p current_user
    # p @comment
      if current_user.id == @comment.user_id
        @comment.destroy
        flash[:notice] = 'comment deleted successfully'
        redirect_to "/posts"
      else
        flash[:notice] = 'Only the author can delete comments'
        redirect_to '/posts'
      end
  end

end
