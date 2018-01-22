class CommentsController < ApplicationController
  before_action :find_post, only: [:create, :edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.create(comment_params)
    @comment.save
    redirect_to post_path(@post)
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def update
    @comment = @post.comments.find(params[:id])
    if @comment.update(comment_params)
      flash[:success] = "Your comment has succesfully been updated."
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:success] = "Your comment has been succesfully deleted"
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
