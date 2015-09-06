class LikesController < ApplicationController

def new
	@photo = Photo.find(params[:restaurant_id])
	@like = Like.new
end

end
