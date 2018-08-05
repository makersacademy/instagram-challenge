class WelcomeController < ApplicationController
  def image_params
    params.require(:image).permit(:title, :image)
  end
end
