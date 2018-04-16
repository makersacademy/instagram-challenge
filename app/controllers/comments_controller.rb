class CommentsController < ApplicationController
  before_action :find_post
  before_action :authenticate_user!

  def create
    @comment = @post.comments.create(params[:comment].permit(:body))
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    @comment.save
    redirect_to post_path(@post)
  end

  def destroy
    @post.comments.where(user_id: current_user.id).destroy_all
    redirect_to posts_url
  end

  private
    def find_post
      @post = Post.find(params[:post_id])
    end
end
