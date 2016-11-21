class PicturesController < ApplicationController
  def index
    @pictures= Picture.all
end

  def new
    @picture = Picture.new
  end
end
