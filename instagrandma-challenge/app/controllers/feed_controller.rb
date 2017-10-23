class FeedController < ApplicationController

before_action :authenticate_gramma!, :except => [:index]

def index
  @images = Image.all
  @new_image = Image.new
end

$like_counter = 0

 def like_image
   @image = Image.find(params[:id])
   likes_array = @image.likes.to_a
   if gramma_signed_in? && likes_array.include?(current_gramma.email)== false
    likes_array << current_gramma.email
    @image.save
    else
      likes_array.delete_if{|user_email| user_email == current_gramma.email}
      @image.save
    end

   redirect_to '/feed'
 end



end
