class PicturesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index 
    
  end 

end
