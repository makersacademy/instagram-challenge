class HomeController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(5)
  end
end
