class PicturesController < ApplicationController

  def show
    @pictures = []
    3.times { |number| @pictures << Picture.new({description: "My pic #{number}" }) }
    render :index
  end


end
