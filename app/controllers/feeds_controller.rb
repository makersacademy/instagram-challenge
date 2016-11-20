class FeedsController < ApplicationController
  before_action do
    @currentUser = current_user.id
  end

  def index
    @photos = Feed.photos.all
    @feed = Feed.find_by_id(@currentUser)
  end

  def update
  end

  def edit
  end

end
