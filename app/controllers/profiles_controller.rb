class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @snaps = Snap.where(snap_user: @user.email).order("created_at DESC")
  end
end
