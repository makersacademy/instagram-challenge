class CommentsController < ApplicationController
  before_action :set_post
  
  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to root_path
    else
      redirect_to root_path, notice: "Failed to save comment"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def set_post 
    @post = Post.find(params[:post_id])
  end
end
