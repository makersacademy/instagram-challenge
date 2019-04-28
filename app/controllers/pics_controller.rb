class PicsController < ApplicationController
  def index
  end

  def new
    @pic = Pic.new
  end
end
