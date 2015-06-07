class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build_with_user(comment_params, current_user)
    if @comment.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if current_user == @comment.user
      @comment.update(comment_params)
      flash[:notice] = 'Comment edited successfully'
    else
      flash[:notice] = 'Cannot edit comment'
    end
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if current_user == @comment.user
      @comment.destroy
      flash[:notice] = 'Comment deleted successfully'
    else
      flash[:notice] = 'Cannot delete comment'
    end
    redirect_to post_path(@post)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
