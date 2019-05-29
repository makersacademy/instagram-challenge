class LikesController < ApplicationController

  before_action :find_post
  before_action :find_like, only: [:destroy] # make sure this method is only called on the destroy method


  def create
    if already_liked?
      flash[:notice] = "You've already liked this picture!"
    else
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to posts_path
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "You haven't liked this post yet!"
    else
      @like.destroy
    end
    redirect_to posts_path
  end
  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end

  #in order to unlike a like you need to find the specific like first!
  def find_like
    @like = @post.likes.find(params[:id])
  end

end
