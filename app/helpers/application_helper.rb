# frozen_string_literal: true

module ApplicationHelper
  def alert_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def form_image_select(post)
    return image_tag post.image.url(:original),
                     id: 'image-preview',
                     class: 'img-responsive' if post.image.exists?
    image_tag '', id: 'image-preview', class: 'img-responsive'
  end
end
