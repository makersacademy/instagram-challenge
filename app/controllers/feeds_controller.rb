class FeedsController < ApplicationController
  before_action :authenticate_user!

  def show
    @posts = Post.includes(:user).limit(10).order(id: :desc)
  end
end
