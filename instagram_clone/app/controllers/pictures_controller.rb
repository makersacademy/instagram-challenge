class PicturesController < ApplicationController
  def new
    @picture = Picture.new
  end
end
