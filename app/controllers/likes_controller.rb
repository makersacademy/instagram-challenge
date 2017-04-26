class LikesController < ApplicationController

  def index

  end

  def create
    @post = Post.find(params[:post_id])
    @post.likes.create(params[:user_id])
    redirect_to "/"
  end

  private

  def likes_param
    params.require(:like).permit(:user, :post)
  end

end
