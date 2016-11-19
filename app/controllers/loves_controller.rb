class LovesController < ApplicationController

  def new
    @image = Image.find(params[:image_id])
    @love = Love.new
  end

  def create
    @image = Image.find(params[:image_id])
    @love = @image.loves.create(love_params)
    @love.image.increase_love
    redirect_to images_path, alert: 'LOVED'
  end

  private

  def love_params
    params.require(:love).permit(:tally)
  end
end
