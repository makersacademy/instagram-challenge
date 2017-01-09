module ApplicationHelper

  def form_image_select(post)
    return image_tag @picture.image.url,
                     id: 'image-preview',
                     class: 'img-responsive' if @picture.image.exists?
    image_tag 'placeholder.jpg', id: 'image-preview', class: 'img-responsive'
  end

end
