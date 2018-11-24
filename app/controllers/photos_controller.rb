# frozen_string_literal: true

class PhotosController < ApplicationController
  before_action :authenticate_user!

  def create
    @photo = Photo.create(user: current_user)
    redirect_to photos_url
  end

  def index
    @photo = Photo.new
    @photos = Photo.all
  end
end
