class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = 'Comment saved.'
      redirect_back fallback_location: root_path
    else
      flash[:alert] = 'Check the comment form, something went wrong.'
      render root_path
    end
  end

  private

  def comment_params
    params.permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
