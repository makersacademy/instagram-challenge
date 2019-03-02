# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Devise::Test::ControllerHelpers
  before_action :authenticate_user!
end
