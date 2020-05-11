
class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    if @comment.save
        redirect_to post_path(@post)
    else
        render 'comments/form'
    end
  end
  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end