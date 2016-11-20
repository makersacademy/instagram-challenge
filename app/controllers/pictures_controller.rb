class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to :action => "index"
    else
      @picture.errors.full_messages.each.with_index do |error, index|
        flash.now["error_#{index}".to_sym] = @picture.errors.full_messages[index]
      end
      render 'new'
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:image, :comment)
  end
end
