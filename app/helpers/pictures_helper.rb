module PicturesHelper
  def picture_params
    params.require(:picture).permit(:image)
  end
end
