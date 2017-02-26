class CommentsController < ApplicationController
  
  before_action :authenticate_user!, :except => [:index, :show]
  
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end
  
  def create
    @post = Post.find(params[:post_id])
    @post.comments.new(comment_params.merge(:user_id => current_user.id))
    @post.save!
    redirect_to "/"
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end
end
