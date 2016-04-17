class CommentsController < ApplicationController

  before_action :find_post

  def create
    @post.comments.create(comment_params)
    redirect_to request.referer
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Comment deleted successfully'
    redirect_to request.referer
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end

    def find_post
      @post = Post.find(params[:post_id])
    end
end
