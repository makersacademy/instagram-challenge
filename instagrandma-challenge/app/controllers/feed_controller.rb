class FeedController < ApplicationController


def index
  @images = Image.all
  @new_image = Image.new
end

$like_counter = 0

 def like_image
   @image = Image.find(params[:id])
   @image.likes +=1
   @image.save
   redirect_to '/feed'
 end

end
