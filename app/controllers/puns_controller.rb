class PunsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @user = current_user if current_user
    @puns = Pun.all
  end

  def new
    @pun = Pun.new
  end

  def create
    user = current_user
    @pun = user.puns.new(pun_params)
    if @pun.save
      redirect_to puns_path
    else
      render 'new'
    end
  end

  def show
    @pun = Pun.find(params[:id])
  end

  def update
    @pun = Pun.find(params[:id])
    @pun.update(pun_params)
    redirect_to '/puns'
  end
  
  def edit
    @pun = Pun.find(params[:id])
    unless @pun.belongs_to_user?(current_user)
      flash[:notice] = 'Pun can only be updated by owner'
      redirect_to '/puns'
    end
  end


  def destroy
    @pun = Pun.find(params[:id])
    unless @pun.user == current_user
      flash[:notice] = 'Pun can only be deleted by owner'
      redirect_to '/puns'
    end
    @pun.destroy
    flash[:notice] = 'Pun deleted successfully'
    redirect_to '/puns'
  end


  private

  def pun_params
    params.require(:pun).permit(:name, :description)
  end
end
