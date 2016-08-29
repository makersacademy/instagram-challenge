class FeedController < ApplicationController

  before_action :authenticate_user!

  def index
    users = [current_user.following, current_user].flatten
    @photos = Photo.where(user: users).order(created_at: :desc)
  end

end
