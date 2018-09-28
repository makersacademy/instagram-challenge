class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  # def edit
  #   @post = Post.find(params[:post_id])
  #   @comment = @post.comments.find(params[:id])
  #   print @comment
  #   print "is comment"
  # end
  #
  # def update
  #   @post = Post.find(params[:post_id])
  #   @comment = @post.comments.find(params[:id])
  #   if @comment.update_attributes(comment_params)
  #     flash[:success] = 'Comment was successfully updated'
  #     redirect_to post_path(@post)
  #   else
  #     flash[:error] = @comment.error.messages.full
  #     redirect_to edit_comment_path
  #   end
  # end
  #
  # def destroy
  #   @post = Post.find(params[:postid])
  #   @comment = @post.comments.find(params[:id])
  #    if @comment.destroy
  #      flash[:success] = 'Comment was successfully deleted'
  #      redirect_to post_path(@post)
  #    else
  #      flash[:error] = @comment.error.messages.full
  #      redirect_to post_path(@post)
  #    end
  # end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  private
    def comment_params
      params.require(:comment).permit(:body).merge(username: current_user.username, user_id: current_user.id)
    end
end
