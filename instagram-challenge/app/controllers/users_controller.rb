class UsersController < ApplicationController
  def show 
    @user = User.find(params[:id])
  end 
  
  def new
   @user = User.new
  end

  def create
    @user = User.new(user_params) 
    if @user.save == true 
      redirect_to user_url(@user.id)
    end 
  
  end 

  private 
  def  user_params
    params.require(:user).permit(:name, :email, :password)
  end 

end
