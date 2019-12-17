# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!

  def new
    @like = Like.new
    @like.post_id = params[:post_id]
    @like.user_id = current_user.id
    if exist_like
      exist_like.destroy!
      redirect_to :root
    else
      @like.save
      redirect_to :root
    end
  end

  private
  def exist_like
    Like.find_by(post_id: params[:post_id], user_id: current_user.id)
  end
end
