class PicturesController < ApplicationController
  def index
  end

  def new
    @picture = Picture.new
  end

  def create
    redirect_to root_path
  end
end
