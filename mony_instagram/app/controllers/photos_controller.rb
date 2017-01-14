class PhotosController < ApplicationController
  def index
    @users = User.all
  end
end
