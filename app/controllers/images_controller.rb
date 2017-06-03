class ImagesController < ApplicationController

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.user_id = current_user.id
    if @image.save
      redirect_to root_path
      puts "saved"
    else
      redirect_to root_path
    end


  end

  private

  def image_params
    params.require(:image).permit(:image, :description, :title)
  end
end
