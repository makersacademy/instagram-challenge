class LikesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_likeable


  def create
    like = Like.create(like_params)
    redirect_to posts_path
  end

  def set_likeable
    @likeable = find_likeable
  end

  def find_likeable
    if params[:post_id]
      Post.find(params[:post_id])
    elsif params[:comment_id]
      Comment.find(params[:comment_id])
    end
  end

  def like_params
    user_and_post = {user: current_user, likeable: @likeable}
  end

end
