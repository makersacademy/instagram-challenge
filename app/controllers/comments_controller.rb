class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:comment_text)
    end
end
