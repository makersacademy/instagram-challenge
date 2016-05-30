class PicturesController < ApplicationController
  before_action :find_picture, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @pictures = Picture.all.order("created_at DESC")
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

  def show
  end

  def edit
  end

  def update
    @picture.update(picture_params)
    flash[:notice] = 'Picture updated successfully'
    redirect_to my_pictures_pictures_path
  end

  def destroy
    @picture.destroy
    flash[:notice] = 'Picture deleted successfully'
    redirect_to my_pictures_pictures_path
  end

  def my_pictures
    p @pictures = Picture.all.where(user_id: current_user.id)
  end

  def upvote
    @picture.upvote_by current_user
    redirect_to :back
  end

  private

  def picture_params
    params.require(:picture).permit(:title, :image)
  end

  def find_picture
    @picture = Picture.find(params[:id]) 
  end
end
