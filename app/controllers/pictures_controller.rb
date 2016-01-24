class PicturesController < ApplicationController
  include PicturesHelper
  before_action :authenticate_user!

  def index
    @user = current_user
  end

  def new
    @user = current_user
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    current_user.pictures << @picture
    if @picture.save
      redirect_to pictures_path
    else
      render "new"
    end
  end
end
