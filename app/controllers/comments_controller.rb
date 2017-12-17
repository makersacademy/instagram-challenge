class CommentsController < ApplicationController

  def create
    @insta_post = InstaPost.find(params[:insta_post_id])
    @comment = @insta_post.comments.create(comment_params)
    redirect_to insta_post_path(@insta_post)
  end

  def destroy
    @insta_post = InstaPost.find(params[:insta_post_id])
    @comment = @insta_post.comments.find(params[:id])
    @comment.destroy
    redirect_to insta_post_path(@insta_post)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
