class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.build
    comment.save
    render json: {new_comment_body: comment.body}
  end
end
