class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      post = Post.find(params[:post_id])
      post.comments << @comment
      current_user.comments << @comment
      redirect_to posts_path, notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to posts_path, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to posts_path, notice: 'Comment was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:body)
  end
end
