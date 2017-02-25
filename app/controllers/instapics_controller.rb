class InstapicsController < ApplicationController

  def index
    @instapics = Instapic.all
  end

  def new
    @instapic = Instapic.new
  end

  def create
    @instapic = Instapic.create(instapic_params)
    redirect_to instapics_path
  end

private

  def instapic_params
    params.require(:instapic).permit(:description)
  end

end
