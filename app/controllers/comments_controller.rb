class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to posts_url
  end


  private
  def comment_params
    params.require(:comment).permit(:user_id, :commenter, :body)
  end
end
