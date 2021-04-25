class GramsController < ApplicationController
  def index
    @grams = Gram.all
  end

  def new
  end

  def create
  end
end
