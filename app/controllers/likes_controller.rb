class LikesController < ApplicationController

  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    @post.likes.create(user_id: current_user.id)
    redirect_to posts_url
  end

  def destroy
    if !(already_liked?)
      nil
    else
      @like.destroy
    end
    redirect_to post_path(@post)
  end
  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_like
    @like = @post.likes.find(params[:id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id:
    params[:post_id]).exists?
  end

end
