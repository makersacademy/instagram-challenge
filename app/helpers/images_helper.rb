module ImagesHelper

  def comments_for_image(id)
    p Comment.where(:image_id=>id)
  end

  def image_username(id)
    User.where(:id=>id)[0]
  end
end
