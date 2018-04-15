class CommentsController < ApplicationController
  before_action :find_post
  before_action :find_comment, only: [:destroy]


  def create
    @comment = @post.comments.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    @comment.save

    redirect_to post_path(@post)
  end

  def destroy
    if current_user.id != @comment.user_id
      flash[:notice] = "This is not your comment"
    else
      @comment.destroy
    end
    redirect_to post_path(@post)
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_comment
    @comment = @post.comments.find(params[:id])
  end

end
