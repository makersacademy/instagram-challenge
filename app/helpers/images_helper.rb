module ImagesHelper

  def comments_for_image(id)
    Comment.where(:image_id=>id)
  end

  def image_username(id)
    p User.where(:id=>id)
  end
end
