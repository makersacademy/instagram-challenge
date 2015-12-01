class CommentsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
  @post = Post.find(params[:post_id])
  @post.comments.create(review_params)
  redirect_to posts_path
end

def review_params
  params.require(:comment).permit(:comment, :hotornot)
end

end
