class UserController < ApplicationController
  before_action :authenticate_user!
  def index
  end
end
