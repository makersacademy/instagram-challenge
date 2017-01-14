class ContributionsController < ApplicationController
  def index
    @all_contributions = Contribution.all
  end

  def new
  end
  
end
