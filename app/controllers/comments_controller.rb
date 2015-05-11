class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    post.comments.create(feedback: params[:feedback])
    redirect_to '/projects'
  end

  private
  def review_params
    params.require(:comment).permit(:feedback)
  end
end
