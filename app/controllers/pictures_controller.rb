class PicturesController < ApplicationController
  def index
    @pictures = Picture.order(created_at: :desc)
    store_location('/pictures')
    # store_location(@picture)
  end

  def show
    @picture = Picture.find(params[:id])
    @back = session[:return_to]

  end

  def new
    @picture = Picture.new
    @back = session[:return_to]
    # @back = @picture
  end

  def edit
    @picture = Picture.find(params[:id])
    @back = session[:return_to]
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    # @picture.image.attach(params[:image])
    if @picture.save
      redirect_to @picture
    else
      render 'new'
    end
  end

  def update
    @picture = Picture.find(params[:id])

    if @picture.update(picture_params)
      redirect_to @picture
    else
      render 'edit'
    end

  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    redirect_to pictures_path
  end

  private

  def picture_params
    params.require(:picture).permit(:title, :image, :caption)
  end
end
