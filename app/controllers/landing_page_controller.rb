# frozen_string_literal: true

class LandingPageController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all
  end
end
