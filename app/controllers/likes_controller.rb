class LikesController < ApplicationController
  def create
  @post = Post.find(params[:post_id])
  @like = @post.likes.create(like_params)

  redirect_to post_path(@post)
end

def destroy
  @like = Like.find(params[:post_id])
  @like.destroy

  redirect_to post_path
end

private
  def like_params
    params.require(:like).permit(:number, :user_id)
  end
end
