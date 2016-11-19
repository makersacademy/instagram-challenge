class PicturesController < ApplicationController

  def new
    @picture = Picture.new
  end

  def index
    @pictures = Picture.all
  end

  def create
    if current_user
      @picture = current_user.pictures.new(picture_params)
      if @picture.save
        redirect_to 'index', notice: 'Picture was successfully uploaded.'
      else
        render action: 'new', notice: 'You must be signed in to upload pictures.'
      end
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:image)
  end

end
