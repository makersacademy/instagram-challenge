class HomeController < ApplicationController
  def index
    @posts = Post.all.order("created_by DESC")
  end
end
