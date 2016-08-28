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
end
