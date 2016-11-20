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

  def edit
    @post = Post.find(params[:post_id])
    @comment  = Comment.find(params[:id])
    @comments = @post.comments.all - [@comment]
    render 'posts/show'
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = 'Your comment has been saved'
    else
      flash[:error] = 'Your comment has not been saved'
    end
    redirect_to post_path(@comment.post.id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:notice] = 'Your comment has been deleted'
    else
      flash[:error] = 'Your comment was not deleted'
    end
    redirect_to post_path(@comment.post.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
