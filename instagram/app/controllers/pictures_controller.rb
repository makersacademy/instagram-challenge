class PicturesController < ApplicationController
  def new
  end

  def create
    render plain: params[:picure].inspect
  end

end
