class GalleriesController < ApplicationController

  def index
    # raise 'Hello from galleries index controller'
    @galleries = Gallery.all
  end
end
