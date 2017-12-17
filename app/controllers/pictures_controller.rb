class PicturesController < ApplicationController
  before_action :authenticate_user!
  def index
    @pictures = Picture.all
  end

  def show
  end

  def new
    @picture = current_user.pictures.new
  end

  def create
    @picture = current_user.pictures.new(picture_params)
    if @picture.save
      flash[:notice] = "Post created successfully."
      redirect_to root_path
    else
      flash[:alert] = "Your new post was not created"
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
