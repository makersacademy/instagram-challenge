class PhotoController < ApplicationController

  before_action do
    @currentUser = current_user.id
  end
  
  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def photo_params
    params = ActionController::Parameters.new(photo: { name: 'Francesco', age: 22, role: 'admin' })
  end
end
