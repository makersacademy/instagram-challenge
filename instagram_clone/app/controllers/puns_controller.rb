class PunsController < ApplicationController

  def index
    @puns = Pun.all
  end

end
