class ListingsController < ApplicationController
  include ListingsHelper
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    current_user.listings << @listing
    if @listing.save
      redirect_to listings_path
    else
      render "new"
    end
  end

  def show
    @listings = Listing.where(user_id: params[:id])
    @user = User.find(params[:id])
  end

end
