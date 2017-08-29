class AlbumsController < ApplicationController

  def index
    @albums = current_user.albums
  end

  def new
  end

  def create
    @album = Album.create(album_params)
    redirect_to @album
  end

  def show
    @album = Album.find(params[:id])
  end

  private

    def album_params
      params.require(:album).permit(:title, :description).merge(user_id: current_user.id)
    end

end
