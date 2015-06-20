class InstagramController < ApplicationController

  def index
    @pictures = Picture.all
  end

end
