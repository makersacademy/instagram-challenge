class PicturesController < ApplicationController
  before_action :authenticate_user!
  def index
    @pictures = Picture.all
  end

  def show
  end

  def new
    @picture = Picture.new()
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      flash[:notice] = "Post created successfully."
      redirect_to(pictures_path)
    else
      render('new')
    end
  end

  def edit
  end


  def delete
  end

  private
  def picture_params
    params.require(:picture).permit(:caption, :image)
  end
end
