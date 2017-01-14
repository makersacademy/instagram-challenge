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

  def edit
    @pun = Pun.find(params[:id])
  end

  def update
  @pun = Pun.find(params[:id])
  @pun.update(pun_params)
  redirect_to '/puns'
end

  private

  def pun_params
    params.require(:pun).permit(:name, :description)
  end

end
