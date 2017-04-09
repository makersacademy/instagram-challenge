module PicturesHelper
  def set_new_with_location(params)
    unless EXIFR::JPEG.new(params[:image].path).gps.nil?
      @latitude = EXIFR::JPEG.new(params[:image].path).gps.latitude
      @longitude = EXIFR::JPEG.new(params[:image].path).gps.longitude
      params[:latitude] = @latitude
      params[:longitude] = @longitude
    end
    Picture.new(params)
  end
end
