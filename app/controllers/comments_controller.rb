class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      flash[:notice] = 'Your comment has been saved'
    else
      flash[:error] = 'Your comment has not been saved'
    end
    redirect_to post_path(@post.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
