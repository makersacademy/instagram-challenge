class FeedController < ApplicationController

  before_action :authenticate_user!

  def index
    @photos = Photo.where(:user => [current_user.following, current_user].flatten).order(created_at: :desc)
  end

end
