# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      flash[:success] = "Welcome back #{user.first_name}!"
      redirect_to posts_url
    else
      flash[:danger] = "Sorry we don't recognise you!"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have signed out!"
    redirect_to posts_url
  end
end
