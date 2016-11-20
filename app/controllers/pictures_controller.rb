class PicturesController < ApplicationController
  def new
    @gallery = Gallery.find(params[:gallery_id])
    @picture = Picture.new
  end
end
