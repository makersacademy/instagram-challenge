class ContributionsController < ApplicationController
  def index
    @all_contributions = Contribution.all
  end

  def new
  end

  def create
    Contribution.create(contribution_params)
    redirect_to '/contributions'
  end

  def contribution_params
    params.require(:contribution).permit(:comment)
  end

end
