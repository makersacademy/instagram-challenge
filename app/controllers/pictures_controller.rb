class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  def index
    @pictures = Picture.all
  end

  def show
  end

  def new
    @picture = Picture.new
  end


  def edit
  end

  def create
    @picture = Picture.new(picture_params)

    if @picture.save
      redirect_to @picture, notice: 'Picture was successfully created.'
    else
       render :new 
    end
  end

  def update
    if @picture.update(picture_params)
      redirect_to @picture, notice: 'Picture was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @picture.destroy
    redirect_to pictures_url, notice: 'Picture was successfully destroyed.'
  end

  private
   
    def set_picture
      @picture = Picture.find(params[:id])
    end

   
    def picture_params
      params.require(:picture).permit(:description)
    end
end
