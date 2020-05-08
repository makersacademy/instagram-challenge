class PostsController < ApplicationController

  def new
  end

  def create
    
  end

  private

  def post_params
    params.require(:post).permit(:image, :filter)
  end
end
