class PostsController < ApplicationController

  private

  def post_params
    params.require(:post).permit(:image, :filter)
  end
end
