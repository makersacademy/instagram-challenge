class HomeController < ApplicationController

  def index
    @user = current_user || nil
    @pictures = Picture.all
    p 'monkeys'
    @pictures.each do |pic| p pic.tag end
  end
end
