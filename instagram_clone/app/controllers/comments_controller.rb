class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to '/posts'
  end

  def comment_params
    params.require(:comment).permit(:thoughts)
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if current_user.id != @comment.user_id
      flash[:notice] = "Cannot edit this"
      redirect_to restaurants_path
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to posts_path
  end


end
