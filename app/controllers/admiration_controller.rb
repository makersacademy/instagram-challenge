class AdmirationController < ApplicationController

  def create
    @photograph = Photograph.find(params[:photograph_id])
    @photograph.admirations.create
    render json: {new_admiration_count: @photograph.admirations.count}
  end

end
