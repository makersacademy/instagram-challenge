class PicturesController < ApplicationController

  def index
    @picture = Picture.all
  end  

end
