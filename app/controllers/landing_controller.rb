# frozen_string_literal: true

# The controller for the landing page
class LandingController < ApplicationController
  include LandingHelper

  def landing
    @grams = Gram.all.reverse
    render 'grams/index'
  end
end
