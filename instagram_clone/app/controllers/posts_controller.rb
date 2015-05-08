class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    p params["post"]
    edited_params = params["post"].merge({time: Time.now.strftime("%y:%b:%d:%H:%M:%S")})
    p edited_params
    Post.create(params['post'])
    redirect_to '/posts'
  end

end
