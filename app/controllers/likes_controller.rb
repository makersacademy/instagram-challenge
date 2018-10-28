# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    @like = Like.create(like_params)
    redirect_to messages_path
  end

  private

  def like_params
    params.permit(:user_id, :message_id)
  end
end
