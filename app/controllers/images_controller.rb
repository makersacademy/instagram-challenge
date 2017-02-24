class ImagesController < ApplicationController

  def index
    @images = Image.last(50)
  end

end
