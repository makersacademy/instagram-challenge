class LikesController < ApplicationController
  before_action :find_post

  def create
    if (Like.where(user_id: current_user.id).exists?)
      flash[:notice] = "You have already liked"
    else
      @like = @post.likes.create(params[:like])
      @like.user_id = current_user.id
      @like.save
    end
      redirect_to post_path(@post)
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

end
