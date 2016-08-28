class MewmentsController < ApplicationController
  def index
    @mewments = Mewment.all
  end
  def new
    @mewment = Mewment.new
  end

  def create
    Mewment.create(mewment_params)
    redirect_to '/mewments'
  end

  def mewment_params
    params.require(:mewment).permit(:caption, :image)
  end

  def edit
    @mewment = Mewment.find(params[:id])
  end

  def update
    @mewment = Mewment.find(params[:id])
    @mewment.update(mewment_params)

    redirect_to '/mewments'
  end

  def destroy
    @mewment = Mewment.find(params[:id])
    @mewment.destroy
    flash[:notice] = "Paw-lease, that picture is gone"

    redirect_to '/mewments'
  end
end
