class GramsController < ApplicationController
  def new
  end

  def create
    render plain: params[:gram].inspect
  end
end
