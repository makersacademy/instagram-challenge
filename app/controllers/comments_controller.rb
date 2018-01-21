class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.save
    redirect_to post_path(@post)
  end

  def edit
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.update(comment_params)
      flash[:success] = "Your comment has succesfully been updated."
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
