class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_user, :only => [:create]

  def create
    begin
      User.create!(user_params)
      render json: { success: true }
    rescue StandardError => e
      render json: { failure: { message: e.message } }
    end
  end

  private
  
  def user_params
    email = params[:email]
    password = params[:password]
    { email: email, password: password }
  end

end
