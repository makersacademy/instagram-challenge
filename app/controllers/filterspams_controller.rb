class FilterspamsController < ApplicationController

  def index
    @filterspams = Filterspam.all
  end

end
