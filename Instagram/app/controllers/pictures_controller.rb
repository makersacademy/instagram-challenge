class PicturesController < ApplicationController
  def new
  end
  def create
  @picture = Picture.new(params[:picture])

  @picture.save
  redirect_to @picture
  end
end
