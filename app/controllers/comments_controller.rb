class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    redirect_to root_url
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    redirect_to post_path(@post)

    # @post = Post.find(params[:post_id])
    # @comment = @post.comments.new(params[:comment])
    @comment.save
  end
 
  private
    def comment_params
      params.require(:comment).permit(:user_id, :text)
    end
end
