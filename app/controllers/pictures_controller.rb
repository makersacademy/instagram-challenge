class PicturesController < ApplicationController
  def new
  end

  def create
    render plain: params[:picture].inspect
  end
end
