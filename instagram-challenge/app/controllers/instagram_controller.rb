class InstagramController < ApplicationController

   before_action :authenticate_user!, :except => [:index, :show]

  def index
    @pictures = Picture.all
  end

  def show
   @user = User.find(params[:id])
  end


end
