class Api::V1::AuthsController < ApplicationController
  skip_before_action :authenticate_user
      
  def create
    token_command = AuthenticateUserCommand.call(*params.slice(:email, :password).values)
    if token_command.success?
      render json: { token: token_command.result } 
    else
      render json: { error: token_command.errors }, status: :unauthorized      
    end
  end

end
