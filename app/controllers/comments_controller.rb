class CommentsController < ApplicationController

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.js { render 'update_comments'}
  end
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if User.find(@comment.user_id) == current_user
      @comment.destroy
    else
      flash[:notice] = "You may not delete this comment"
    end
    redirect_to posts_url
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
