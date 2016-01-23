module PicturesHelper
  def picture_params
    params.require(:picture).permit(:title, :description, :image)
  end
end
