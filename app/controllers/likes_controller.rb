class LikesController < ApplicationController
  before_action :find_post
  before_action :authenticate_user!

  def create
    @like = @post.likes.create(user_id: current_user.id, post_id: @post.id)
    redirect_to posts_url
  end

  def destroy
    @post.likes.where(user_id: current_user.id, post_id: @post.id).destroy_all
    redirect_to posts_url
  end

  private
    def find_post
      @post = Post.find(params[:post_id])
    end
end
