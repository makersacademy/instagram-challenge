class TurtlegramsController < ApplicationController
  def index
  end

  def new
    @turtlegram = Turtlegram.new
  end

  def create
    @turtlegram = Turtlegram.create(turtlegram_params)
    redirect_to '/turtlegrams'
  end

  private

  def turtlegram_params
    params.require(:turtlegram).permit(:caption, :image)
  end
end
