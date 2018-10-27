# frozen_string_literal: true

# The controller for the application
class ApplicationController < ActionController::Base
  include ApplicationHelper

  def landing
    if user_signed_in?
      @grams = Gram.all
      render 'grams/index'
    else
      render 'overview'
    end
  end
end
