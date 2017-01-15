class LikesController < ApplicationController
  def create
    @contribution = Contribution.find(params[:contribution_id])
    @contribution.likes.create
    redirect_to contributions_path
  end
end
