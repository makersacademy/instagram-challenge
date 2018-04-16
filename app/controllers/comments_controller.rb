class CommentsController < ApplicationController
  before_action :find_post
  before_action :authenticate_user!

  def create
    @comment = @post.comments.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    @comment.save
    redirect_to posts_path
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

end
