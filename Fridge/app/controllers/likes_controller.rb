class LikesController < ApplicationController

  def create
    p "*******"
    p "User ID"
    p params[:user_id]
    p "photo ID"
    p params[:photo_id]
    p "*******"

    # here I'll create a new like in the Likes database
    # having the data above.

    # Later I'll show likes on the website
    # and checkeced if a particular user haven't liked twice.
  end


end
