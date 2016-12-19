class LikesController < ApplicationController

  def new
    # @image = Image.find(params[:image_id])
    # @love = Love.new
    @image = Image.find(params[:image_id])
    @like = @image.likes.create
    flash[:notice] = "Thanks for your like!"
    redirect_to images_path
  end

  def create
    # @image = Image.find(params[:image_id])
    # @love = @image.loves.create(love_params)
    # @love.tally = 1
    # redirect_to images_path
  end
  #
  # private
  #
  # def like_params
  #   params.require(:like)
  # end
end
