# frozen_string_literal: true

class LandingPageController < ApplicationController
  def index
    if user_signed_in?
      @post = Post.new
      @posts = Post.all
      render :index
    else
      render :home
    end
  end
end
