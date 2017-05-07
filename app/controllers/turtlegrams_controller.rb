class TurtlegramsController < ApplicationController
  def index
  end

  def new
    @turtlegram = Turtlegram.new
  end

  def create
    @turtlegram = Turtlegram.create(turtlegram_params)
    @turtlegram.user = current_user
    if @turtlegram.save
      redirect_to '/turtlegrams'
    else
      render 'new'
    end
  end

  def show
  
  end

  private

  def turtlegram_params
    params.require(:turtlegram).permit(:caption, :image)
  end
end
