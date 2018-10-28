# frozen_string_literal: true

# The controller for the landing page
class LandingController < ApplicationController
  include LandingHelper

  def landing
    if user_signed_in?
      @grams = Gram.all.reverse
      render 'grams/index'
    else
      render 'overview'
    end
  end
end
