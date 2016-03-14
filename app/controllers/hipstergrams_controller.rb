class HipstergramsController < ApplicationController
  
  before_action :authenticate_hipster!
  before_action :check_author, :only => [:edit, :update, :destroy]

  def index
   @hipstergrams = Hipstergram.all 
   @hipster = current_hipster
  end

  def show
    @hipstergram = Hipstergram.find(params[:id])
  end

  def new
    @hipstergram = Hipstergram.new
  end

  def create
    @hipstergram = Hipstergram.new(hipstergram_params)
    if @hipstergram.save
      redirect_to "/hipstergrams"
    else
      render "new"
    end
  end

  def hipstergram_params
    new_params = params.require(:hipstergram).permit(:image, :description)
    new_params[:hipster_id] = current_hipster.id
    new_params
  end

  def destroy
    @hipstergram = Hipstergram.find(params[:id])
    @hipstergram.destroy
    flash[:notice] = "Photogram disintergrated. Sic transit gloria mundi"
    redirect_to "/hipstergrams"
  end

  def check_author
    if current_hipster.id != Hipstergram.find(params[:id]).hipster_id
      flash[:notice] = "You can't delete things you don't understand"
      redirect_to "/hipstergrams" and return
    end
   end

end
