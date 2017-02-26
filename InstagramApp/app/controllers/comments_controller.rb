class CommentsController < ApplicationController
  def new
  @post = Post.find(params[:post_id])
  @comment = Comment.new
end
def create
  @post = Post.find(params[:post_id])
  @comment = Comment.create(content: comment_params["content"], post_id: @post.id, user_id: current_user.id)
    redirect_to '/posts'
end

private

def comment_params
  params.require(:comment).permit(:content)
end

end
