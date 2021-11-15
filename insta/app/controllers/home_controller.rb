class HomeController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc) #@posts var which orders all posts into index.html
  end
end
