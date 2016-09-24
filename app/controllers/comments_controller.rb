class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @post = Post.find(params[:post_id])
    render json: { comments_count: @post.comments.count, comments: @post.comments }
  end

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create_with_user(comment_params, current_user)
    render json: { last_ten_comments: @post.comments }
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end

end
