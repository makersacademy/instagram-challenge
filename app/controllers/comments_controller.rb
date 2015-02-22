class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    if !current_user
      flash[:notice] = 'You have to be logged in to leave a comment'
      redirect_to new_user_session_path
    else
      @comment = Comment.new
    end
  end

  def create
    @post = Post.find(params[:post_id])
    comment = @post.build_comment(comment_params, current_user)
    if comment.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
