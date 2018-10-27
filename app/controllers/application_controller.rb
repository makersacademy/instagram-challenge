# frozen_string_literal: true

# The controller for the application
class ApplicationController < ActionController::Base
  include ApplicationHelper

  def landing; end

  def random_function(x)
    2*x
  end 
end
