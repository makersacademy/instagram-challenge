class ImagesController < ApplicationController
  def new

  end

  def create
    current_user.images.create(name: params[:name], url: params[:url])
    redirect_to '/'
  end

end
