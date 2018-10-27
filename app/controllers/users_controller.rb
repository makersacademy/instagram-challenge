# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def follow
    @user = current_user
    @follow_user = User.find(params[:id])
    if !@user.follows?(@follow_user)
      @user.follow!(@follow_user)
      redirect_back fallback_location: root_path, notice: "Successfully followed."
    else
      @user.unfollow!(@follow_user)
      redirect_back fallback_location: root_path, notice: "Successfully unfollowed."
    end
  end
end
