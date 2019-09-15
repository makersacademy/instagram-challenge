# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user.email
    @photos = Photo.all
  end
end
