class PicturesController < ApplicationController

  def index
    @pictures = Picture.all.order("created_at DESC")
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(picture_params)

    if @picture.save
      redirect_to pictures_path, notice: "Successfully created a Picture"
    else
      @errors = @picture.errors
      render 'new'
    end
  end

  def show
    find_picture
  end

  def destroy
    find_picture.destroy
    redirect_to '/pictures'
  end

  private

    def picture_params
      params.require(:picture).permit(:image) if params[:picture]
    end

    def find_picture
      @picture = Picture.find(params[:id])
    end
end
