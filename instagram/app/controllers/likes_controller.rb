class LikesController < ApplicationController

  def create
     @image = Image.find(params[:post_id])
     if @image.user_id != current_user.id
       @like = Like.create(image_id: @image.id, user_id: current_user.id)
       flash[:alert] = "You cannot like a post more than once" if !@like.save
     else
       flash[:alert] = "You cannot like your own post"
     end
     redirect_to posts_path
   end
end
