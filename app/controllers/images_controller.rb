class ImagesController < ApplicationController
  def index
  end

  def new
  end

  def create
    p params[:image][:message]
  end
end
