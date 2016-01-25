module PicturesHelper
  def picture_params
    params.require(:picture).permit(:description, :image)
  end
end
