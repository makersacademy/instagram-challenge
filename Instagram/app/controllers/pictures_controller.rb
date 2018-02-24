class PicturesController < ApplicationController
  def new
  end
  def create
  @picture = Picture.new(params[:pictures])

  @picture.save
  redirect_to @picture
  end
end
