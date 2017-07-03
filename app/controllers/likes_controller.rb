class LikesController < ApplicationController

  def create
    @user_id = current_user.id
    @post_id = params[:post_id]

    existing_like = Like.find_by(user_id: @user_id, post_id: @post_id)

    if existing_like
      existing_like.destroy
    else
      @like = Like.new({user_id: @user_id, post_id: @post_id})
      @like.save!
    end

    redirect_to posts_path
  end

end
