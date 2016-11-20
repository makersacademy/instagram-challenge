class FeedsController < ApplicationController
  before_action do
    @currentUser = current_user.id
  end

  def index
    feed = Feed.find_by(user_id: @currentUser)
    @feed_id = feed.id
    @photos = Photo.all.order(created_at: :asc)
  end

  def update
  end

  def edit
  end

end
