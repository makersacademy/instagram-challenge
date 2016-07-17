class CommentsController < ApplicationController

 def index
   create
  #  redirect_to action: "create", id: params[:id]
 end

  def new
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post = Post.find(params[:post_id])
    @comment.user = current_user
    if @comment.save
      redirect_to posts_path
    else
      flash[:error]='Cannot comment'
      redirect_to posts_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
