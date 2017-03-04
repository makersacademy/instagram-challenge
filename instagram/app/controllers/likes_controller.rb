class LikesController < ApplicationController

  def create
     @image = Image.find(params[:image_id])
     if @image.user_id != current_user.id
       @like = Like.create(image_id: @image.id, user_id: current_user.id)
       flash[:alert] = "You cannot like a image more than once" if !@like.save
     else
       flash[:alert] = "You cannot like your own image"
     end
     redirect_to images_path
   end
end
