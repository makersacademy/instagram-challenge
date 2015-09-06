class HomeController < ApplicationController

  def index
    @photos = Photo.last(30).reverse
  end
end
