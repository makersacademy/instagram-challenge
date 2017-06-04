class PicturesController < ApplicationController
  before_action :authenticate_user!

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(pictures_params)
    redirect_to pictures_url
  end

  def show
    @picture = Picture.find(params[:id])
    redirect_to pictures_url
  end

  def upvote
  @picture = Picture.find(params[:id])
  @picture.upvote_by current_user
  redirect_to pictures_url
end

def downvote
  @picture = Picture.find(params[:id])
  @picture.downvote_by current_user
  redirect_to pictures_url
end

  private

  def pictures_params
    params.require(:picture).permit(:title, :image)
  end

end
