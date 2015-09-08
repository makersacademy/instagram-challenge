class LikesController < ApplicationController

def new
	@photo = Photo.find(params[:photo_id])
	@like = Like.new
end

# def create
# 	@photo = Photo.find(params[:photo_id])
# 	@photo.likes.create(like_params)
# end

def create
  @photo = Photo.find(params[:photo_id])
  @like = @photo.likes.build(like_params.merge({user: current_user}))
  if @like.save
    redirect_to photos_path
  else
    flash[:notice] = 'Houston we have a problem'
    render 'new'
  end
end


# def create
#   @photo = Photo.find(params[:photo_id])
#   @like = @photo.likes.build(like_params)
#   if @like.save
#     redirect_to photos_path
#   else
#   	flash[:notice] = 'Houston we have a problem'
#     render 'new'
#   end
# end

def like_params
	params.permit(:like)
end	

end
