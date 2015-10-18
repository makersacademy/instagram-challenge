class CommentsController < ApplicationController

  def new
  end

  def create
    @comment = Comment.new(post_params.merge(post_params))
    if @comment.save
      @comment.update(post_id: params[:post_id], user_id: current_user.id)
      redirect_to post_path(Post.find(params[:post_id]))
    end
  end

  def post_params
    params.require(:comment).permit(:comment)
  end

end
