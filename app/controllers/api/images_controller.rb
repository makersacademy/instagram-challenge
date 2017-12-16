class Api::ImagesController < ApplicationController
  def index
    images = Image.all
    reactions = Reaction.all
    render :json => { images: images, reactions: reactions }
  end
end
