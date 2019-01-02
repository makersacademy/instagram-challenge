class LikesController < ApplicationController

  before_action :find_post

  def create
    if already_liked?
      nil
    else
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to posts_url
  end

  def destroy
    @like = Like.find(params[:id])
    if !(already_liked?)
      nil
    else
      @like.destroy
    end
    redirect_to posts_url
  end

  private

  def already_liked?
    Like.where(user_id: current_user.id, post_id:
    params[:post_id]).exists?
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

end
