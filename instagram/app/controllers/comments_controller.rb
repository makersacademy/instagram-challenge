class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find params[:post_id]
    @comment = @post.comments.build_with_user(comment_params, current_user)
    if @comment.save
      redirect_to posts_path
    else
      if @comment.errors[:user]
        redirect_to posts_path, alert: 'You have already commented on this post'
      else
        render :new
      end
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:thoughts)
  end

end
