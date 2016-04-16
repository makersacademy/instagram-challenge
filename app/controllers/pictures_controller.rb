class PicturesController < ApplicationController

  def index
    all_pictures
  end

  private

  def all_pictures
    @pictures = Picture.all
  end
end
