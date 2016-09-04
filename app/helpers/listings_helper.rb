module ListingsHelper
  def listing_params
    @listing_params = params.require(:listing).permit(:day, :hour, :mins)
    @listing_params[:start_time] = params[:listing][:hour].to_i*60 + params[:listing][:mins].to_i
    return @listing_params
  end
end
