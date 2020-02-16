class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    @comment.save
    
    redirect_to posts_url
  end
 
  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
