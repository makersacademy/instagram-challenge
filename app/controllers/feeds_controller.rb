class FeedsController < ApplicationController
  def index
  end

  def new
    if !user_signed_in?
      redirect_to '/feeds'
    end
  end

  def create
  end

  def update
  end

  def edit
  end

end
