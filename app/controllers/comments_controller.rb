class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    current_user.comments << @comment
    if @comment.valid?
      redirect_to posts_path
    else
      flash[:notice] = 'Sorry! your comment must be more than 3 letters long'
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:opinions)
  end

end
