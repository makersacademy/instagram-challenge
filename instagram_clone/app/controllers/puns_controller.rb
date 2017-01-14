class PunsController < ApplicationController

  def index
    @puns = Pun.all
  end

  def new
    @pun = Pun.new
  end

  def create
    Pun.create(pun_params)
    redirect_to '/puns'
  end

  def show
    @pun = Pun.find(params[:id])
  end

  private

  def pun_params
    params.require(:pun).permit(:name)
  end

end
