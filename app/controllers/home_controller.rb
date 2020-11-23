class HomeController < ApplicationController
  def index
    @posts = Post.all.reverse_order
  end
end
