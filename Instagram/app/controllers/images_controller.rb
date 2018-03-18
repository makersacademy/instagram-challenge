class ImagesController < ApplicationController

  def index
    # @images = Image.all
    @images = Image.all.paginate(:page => params[:page], :per_page => 9)
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.save
    if @image.errors.empty?
      redirect_to images_url
    else
      messages = ""
      @image.errors.full_messages.each do |message|
        if message.include? 'Image is invalid'
          flash[:notice] = 'Incorrect file type, please use .jpg or .png'
        else
          messages += message
          flash[:notice] = messages
        end
      end
      render :new
    end
  end

  def show
    @image = Image.find params[:id]
  end

  private

  def image_params
    params.require(:image).permit(:user, :caption, :image)
  end

end
