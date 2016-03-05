class ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def new

  end

end
