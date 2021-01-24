class InstagramController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @posts = Post.order(created_at: :desc)
  end
end
