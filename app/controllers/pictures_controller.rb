class PicturesController < ApplicationController
  def index
  end

  def new
    @picture = Picture.new
  end
end
