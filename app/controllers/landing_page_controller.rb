# frozen_string_literal: true

class LandingPageController < ApplicationController
  def index
    @post = Post.new
  end
end
