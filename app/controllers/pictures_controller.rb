class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

end
