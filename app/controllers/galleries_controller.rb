class GalleriesController < ApplicationController
before_action :authenticate_user!, :except => [:index, :show]
  def index
    # raise 'Hello from galleries index controller'
    @galleries = Gallery.all
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    @gallery.user_id = current_user.id
    if @gallery.save
      flash[:notice] = "The \"#{@gallery.name}\" gallery was successfully created"
      redirect_to "/galleries"
    else
      render 'new'
    end
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    # @gallery.update(gallery_params)
    if @gallery.update(gallery_params)
      flash[:notice] = "The \"#{@gallery.name}\" gallery was successfully updated"
      redirect_to gallery_path
    else
      render "edit"
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    flash[:notice] = "The \"#{@gallery.name}\" gallery was successfully deleted"
    redirect_to "/galleries"
  end

  private
  def gallery_params
    params.require(:gallery).permit(:name)
  end
end
