class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to listings_path
    else
      render "new"
    end
  end

  def listing_params
    @listing_params = params.require(:listing).permit(:day, :hour, :mins)
    @listing_params[:start_time] = params[:listing][:hour].to_i*60 + params[:listing][:mins].to_i
    return @listing_params
  end

end
