class CommentsController < ApplicationController
  before_action :current_post

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:notice] = "comment sent!"
      redirect_to(posts_path)
    else
      flash[:alert] = "Unable to send comment please check the form"
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def current_post
    @post = Post.find(params[:post_id])
  end
end
