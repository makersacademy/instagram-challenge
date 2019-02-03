class PicturesController < ApplicationController

  def index
    @pictures = Pictures.all
    respond_to do |format|
    format.html # index.html.erb
  end
  end

  def create
    @picture = Pictures.create(:link => picture_params)
    p @picture
    # @value = Cloudinary::Uploader.upload(params[:image])
    if @picture.save
      redirect_to pictures_path
    end

  end

  private
  def picture_params
    params.require(:picture).permit(:link)

  end

end
