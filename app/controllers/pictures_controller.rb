class PicturesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :set_picture, only: [:show, :edit, :update, :destroy]


  def index
    @pictures = Picture.all
  end

  def show
  end

  def new
    @picture = current_user.pictures.build
  end


  def edit
  end

  def create
    @picture = current_user.pictures.build(picture_params)

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

    def correct_user
      @picture = current_user.pictures.find_by(params[:id])
      redirect_to pictures_path, notice: "Not authorised to edit this pin" if @picture.nil?
    end

   
    def picture_params
      params.require(:picture).permit(:description, :image)
    end
end
