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
    @images = Image.paginate(page: params[:page])
      last_page = (@images.length.to_f/9).ceil
    url = '/images?page=' + last_page.to_s
    if @image.errors.empty?
      redirect_to url
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

  def destroy
    @image = Image.find params[:id]
    @image.destroy
    @images = Image.paginate(page: params[:page])
    if @images.length == 0
      last_page = 1
    else
      last_page = (@images.length.to_f/9).ceil
    end
    url = '/images?page=' + last_page.to_s
    redirect_to url
  end

  private

  def image_params
    params.require(:image).permit(:user, :caption, :image)
  end

end
