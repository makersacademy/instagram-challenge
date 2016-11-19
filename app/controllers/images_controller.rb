class ImagesController < ApplicationController

  def index
    @image = =Image.all
  end

  def new
    @image = Image.new
  end
end
