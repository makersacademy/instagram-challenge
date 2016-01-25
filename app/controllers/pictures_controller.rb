class PicturesController < ApplicationController
  include PicturesHelper
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @pictures = Picture.order(created_at: :desc)
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.new(picture_params)
    return redirect_to pictures_path if @picture.save
    render 'new'
  end
end
