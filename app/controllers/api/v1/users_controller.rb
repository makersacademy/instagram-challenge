class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_user, :only => [:create]
  skip_before_action :verify_authenticity_token

  def create
    user = User.create(user_params)
    user.save!
    
    redirect_to api_v1_auth_url(user_params)
  end

  private
  
  def user_params
    email = params[:email]
    password = params[:password]
    {email: email, password: password}
  end

end
