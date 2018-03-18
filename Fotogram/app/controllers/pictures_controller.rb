class PicturesController < ApplicationController
  before_action :find_pic, only: [:show, :edit, :update, :destroy]

  def index
    @pictures = Picture.all.order("created_at DESC")
  end

  def show
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(pic_params)

    if @picture.save
      redirect_to @picture, notice:"Your picture was succesfully posted"
    else
      render "new"
    end
  end

  def destroy
    @picture.destroy
    redirect_to root_path
  end

  private

  def pic_params
    params.require(:picture).permit(:title, :description)
  end

  def find_pic
    @picture = Picture.find(params[:id])
  end
end
