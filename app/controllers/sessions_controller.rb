class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id.to_s
      redirect_to root_path, notice: 'Successfully logged in'
    else
      flash.now.alert = 'Incorrect email or password, try again'
      redirect_to login_path, notice: 'Incorrect login details'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: 'Logged out'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
