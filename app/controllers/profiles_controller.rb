# frozen_string_literal: true

class ProfilesController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
    @posts = User.find_by(username: params[:username]).posts.order('created_at DESC')
  end
end
