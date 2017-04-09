class PicturesController < ApplicationController
  # before_action :set_picture, only: [:show, :edit, :update, :destroy]
  def index
    @pictures = Picture.all
  end

  def new
    # @picture = Picture.new
    @picture = current_user.pictures.build
    # p current_user.id
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def edit
    @picture = Picture.find(params[:id])
    @picture.update(picture_params)
    redirect_to '/pictures'
  end

  def update
    # @picture = Picture.find(params[:id])
    # @picture.update(picture_params)
    # redirect_to '/pictures'
  end

  def create
    # @picture = Picture.create(picture_params)
    @picture = current_user.pictures.build(picture_params)
    # Tag.create(tag_params)

    if @picture.save
      flash[:success] = "Picture successfully added"
      redirect_to pictures_path
    else
      flash[:alert] = "Your picture could not be uploaded.  Please check the form."
      redirect_to pictures_path
    end

    # if @picture.save
    #     format.html { redirect_to pictures_path, notice: 'Restaurant was successfully created.' }
    #     format.json { render :show, status: :created, description: @picture }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @picture.errors, status: :unprocessable_entity }
    #   end
  end


  private

  # can use this to only permit certain parameters

  # def set_picture
  #   @picture = Picture.find(params[:id])
  # end

  def picture_params
    params.require(:picture).permit(:description, :image)
  end

  # def edit_params
  #   params.permit(:picture)
  # end
end
