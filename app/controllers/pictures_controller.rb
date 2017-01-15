class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(params_image)
    if @picture.save
      redirect_to(@picture, :notice => 'Photo was successfully created.')
    else
      render :action => "new"
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(params_image)

    redirect_to("/pictures")
  end

  # def destroy
  #   @picture = Picture.find(params[:id])
  #   @picture.destroy
  #   redirect_to(picture_url)
  # end

  private

  def params_image
    params.require(:picture).permit(:image, :name)
  end

end
