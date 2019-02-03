class PicturesController < ApplicationController

  def index
    @pictures = Pictures.all
  end

  def new
    @picture = Pictures.new({:link => @value['secure_url']})
    @picture.save
  end

end
