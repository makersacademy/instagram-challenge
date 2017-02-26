class LikesController < ApplicationController

  def new
    self.create
  end

  def create
    @instapic = Instapic.find(params[:instapic_id])
    @instapic.likes.create
    redirect_to instapics_path
  end

end
