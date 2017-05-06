class TravelgramsController < ApplicationController
  def index
    @adventures = Travelgram.all
  end

  def new
    @adventure = Travelgram.new
  end

  def create
    @adventure = Travelgram.create(travelgram_params)
    redirect_to '/travelgrams'
  end

  def show
    @adventure = Travelgram.find(params[:id])
  end

  def edit
    @adventure = Travelgram.find(params[:id])
  end

  def update
    @adventure = Travelgram.find(params[:id])
    @adventure.update(travelgram_params)
    redirect_to '/travelgrams'
  end

  def destroy
    @adventure = Travelgram.find(params[:id])
    @adventure.destroy
    flash[:notice] = "Adventure deleted successfully"
    redirect_to '/travelgrams'
  end

  private

  def travelgram_params
    params.require(:travelgram).permit(:name, :description)
  end
end
