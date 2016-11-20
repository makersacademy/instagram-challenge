class UserthoughtsController < ApplicationController
  def new
  @picture = Picture.find(params[:picture_id])
  @userthought = Userthought.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.userthoughts.create(userthought_params)
    redirect_to '/pictures'
  end

  private

  def userthought_params
    params.require(:userthought).permit(:thoughts, :rating)
  end

end
