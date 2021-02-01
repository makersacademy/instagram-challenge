class PhotosController < ApplicationController

  before_action :authorize, except: :index

  def index
    @photos = Photo.all.order("created_at DESC")
  end

  def capture
    @value = Cloudinary::Uploader.upload(params[:image])
    @photo = Photo.new({:link => @value['secure_url'], :caption => params[:caption]})
    if @photo.save
      Pusher.trigger('my-channel', 'my-post', {
        link: @photo.link,
        caption: @photo.caption
      })
    end
    redirect_to photos_url
  end

  def like
    @photo = Photo.all.find(params[:id])
    Like.create(user_id: current_user.id, photo_id: @photo.id)
    redirect_to photo_path(@photo)
  end 

end
