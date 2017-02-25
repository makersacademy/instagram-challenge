module ImagesHelper

  def comments_for_image(id)
    p Comment.where(:image_id=>id)
  end

end
