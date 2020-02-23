class UsersController < ApplicationController
  before_action :authorised, except: [:new, :create]
  before_action :logged_in, only: [:index, :new, :create]
  def new; end

  def index; end

  def create
    new_user = User.new user_params

    if validate_signup && new_user.save
      session[:id] = new_user.id
      redirect_to "/users/#{session[:id]}"
    else
      set_signup_error
      redirect_back fallback_location: root_path
    end
  end

  def show
    @user = User.find(params[:id])
    @user_posts = Post.where({ user_id: @user.id }).order(created_at: :desc)
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end

  def validate_signup
    params[:email] =~ URI::MailTo::EMAIL_REGEXP &&
      params[:password] == params[:password_confirmation]
  end

  def set_signup_error
    if User.find_by({ email: params[:email] })
      session[:existing_email] = true
      session[:doubled_email] = params[:email]
    elsif !validate_signup
      session[:invalid_signup] = true
    end
  end

  def authorised
    redirect_to root_path unless session[:id]
  end

  def logged_in
    redirect_to posts_path if session[:id]
  end
end
