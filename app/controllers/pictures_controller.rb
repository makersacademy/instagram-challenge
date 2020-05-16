class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :destroy]

  def index
    @pictures = Picture.order(created_at: :desc)
  end

  def show
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)

    @picture.user = current_user

    respond_to do |format|
      if @picture.save
        format.html { redirect_to pictures_url, notice: 'Picture was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:image)
  end
end
