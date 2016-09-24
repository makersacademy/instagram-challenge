class ProfilesController < ApplicationController

  def index
  end

  def show
    @user = User.find_by_username(params[:id])
  end

  def update
    User.find(current_user.id).update_attributes(profile_params)
    render json: {}
  end

  private

  def profile_params
    params.require(:profile).permit(:image)
  end

end
