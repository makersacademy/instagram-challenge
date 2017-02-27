class InstapicsController < ApplicationController

  before_action :authenticate_user!

  def index
    @instapics = Instapic.all.reverse
    @users = User.all
  end

  def new
    @instapic = Instapic.new
  end

  def create
    @instapic = current_user.instapics.create(instapic_params)
    redirect_to instapics_path
  end

private

  def instapic_params
    params.require(:instapic).permit(:description, :image)
  end

end
