module ImagesHelper

  def comments_for_image(id)
    Comment.where(:image_id=>id)
  end

end
