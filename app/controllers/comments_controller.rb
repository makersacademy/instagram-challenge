class CommentsController < ApplicationController

  def index
    @post = Post.find(params[:post_id])
    redirect_back fallback_location: { action: "show", id: @post.id }
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

    if @comment.save
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:user, :body)
    end
end
