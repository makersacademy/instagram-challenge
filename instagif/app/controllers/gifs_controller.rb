require './lib/giphy_api_request'

class GifsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @gifs = Gif.all.reverse_order
  end

  def new
    @gif = Gif.new
  end

  def create
    @giphy_api = GiphyApi.new
    unless gif_params[:generator].empty?
      gif_url = @giphy_api.translate_request_url(gif_params[:generator])
      @gif = Gif.new(url: gif_url, generator: gif_params[:generator])
      if @gif.save
        redirect_to '/gifs'
      else
        render 'new'
      end
    else
        flash[:notice] = 'No string given: please enter a string'
        @gif = Gif.new
        redirect_to '/gifs/new'
    end
  end

  def show
    @gif = Gif.find(params[:id])
    @comments = @gif.comments.all.reverse_order
  end

  def destroy
    @gif = Gif.find(params[:id])
    @gif.destroy
    flash[:notice] = 'Gif is gone for good'
    redirect_to '/gifs'
  end

  def gif_params
    params.require(:gif).permit(:generator, :url)
  end
end
