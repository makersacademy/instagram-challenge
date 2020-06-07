class SessionsController < ApplicationController
  def new
  end

  def create
    redirect_to '/pictures', notice: 'Welcome Marius Brad'
  end
end
