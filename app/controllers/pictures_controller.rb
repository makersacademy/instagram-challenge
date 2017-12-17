class PicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :restrict_to_user, only: [:edit, :update, :destroy]
  def index
    @pictures = Picture.all.order('created_at DESC')
  end

  def show
     @picture = Picture.find(params[:id])
  end

  def new
    @picture = current_user.pictures.new
  end

  def create
    @picture = current_user.pictures.new(picture_params)
    if @picture.save
      flash[:notice] = "Post created successfully."
      redirect_to root_path
    else
      flash[:alert] = "Your new post was not created"
      render('new')
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
  end

  def delete
    @picture = Picture.find(params[:id])
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = "Subject '#{@picture.caption}' destroyed successfully."
    redirect_to root_path
  end

  private
  def picture_params
    params.require(:picture).permit(:caption, :image)
  end

  def restrict_to_user
    unless current_user == @picture.user
      flash[:alert] = "You have not posted this picture"
      redirect_to root_path
    end
  end
end
