class LikesController < ApplicationController

   def create
     @like = Like.create(like_params)
     redirect_to images_url
   end

 private

  def like_params
    params.permit(:user_id, :image_id)
  end

end
