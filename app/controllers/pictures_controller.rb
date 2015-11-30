class PicturesController < ApplicationController
  
  before_action :authenticate_user!, :except => [:index]

  def index
    @picture = Picture.all
    @comment = Comment.new
  end  

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    if @picture.save
      redirect_to pictures_path
    else
      render 'new'
    end
  end

  def picture_params
    params.require(:picture).permit(:caption, :image)
  end

end
