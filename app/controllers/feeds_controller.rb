class FeedsController < ApplicationController
  before_action do
    @currentUser = current_user.id
  end

  def index
    # @photos = Feed.photo
    feed = Feed.find_by(user_id: @currentUser)
    @feed_id = feed.id
    # @photos = Photo.find_by_id(@feed.id)
  end

  def update
  end

  def edit
  end

end
