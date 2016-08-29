class LikesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.likes.create
    redirect_to '/pictures'
  end

end
