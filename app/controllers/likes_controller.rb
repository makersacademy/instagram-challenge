# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!
  # signed out user cannot like a post on post#show page

  def create
    @post = Post.find(params[:post_id])
    @like = Like.new
    @like.user_id = current_user.id
    @like.post_id = params[:post_id]
    if @like.save
      flash[:alert] = 'you have liked a post'
      redirect_to post_path(@post)
    else
      render :new, error: 'like not recorded'
    end
  end
end
