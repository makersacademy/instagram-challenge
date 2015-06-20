class InstagramController < ApplicationController

  def index
    @pictures = Picture.all
    @comments = Comment.all
  end

end
