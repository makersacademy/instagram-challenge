class ImagesController < ApplicationController

    def index
      @images = Image.all
    end

    def new
      @image = Image.new
    end

    def create
      Image.create(image_params)
      redirect_to '/images'
    end


private

  def image_params
    params.require(:image).permit(:name)
  end

end
