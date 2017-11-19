class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.where(post_id: @post.id, user_id: current_user.id)

    if !@like.empty?
      @like[0].destroy
      redirect_to request.referrer
      return
    end

    @like = @post.likes.create(post_id: params[:post_id], user_id: current_user.id)
    redirect_to request.referrer
  end

  def index
    @users= []
    @post = Post.find(params[:post_id])
    @like = Like.where(post_id: @post.id)
    @like.each do |like|
      @users << User.find(like.user_id)
    end
  end

end
