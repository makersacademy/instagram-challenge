class AdmirationController < ApplicationController

  def create
    @photograph = Photograph.find(params[:photograph_id])
    @photograph.admirations.create
    redirect_to photographs_path
  end

end
