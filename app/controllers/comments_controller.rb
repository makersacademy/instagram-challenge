class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
  @post = Post.find(params[:restaurant_id])
  @post.comments.create(review_params)
end

def review_params
  params.require(:comment).permit(:comment, :hotornot)
end

end
