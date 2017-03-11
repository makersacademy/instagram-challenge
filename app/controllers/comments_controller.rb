class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find params[:post_id]
    @comment = @post.build_comment(comment_params, current_user)
    if @comment.save
      redirect_to "/posts/#{@post.id}"
    else
      render :new
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
