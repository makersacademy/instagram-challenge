module ApplicationHelper
  def alert_for(flash_type)
    { success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info' }[flash_type.to_sym] || flash_type.to_s
  end

  def form_image_select(post)
    if post.image.exists?
      return image_tag post.image.url(:medium),
                       id: 'image-preview',
                       class: 'img-responsive'
    end
    image_tag 'placeholder.jpg', id: 'image-preview', class: 'img-responsive'
  end

  def profile_avatar_select(user)
    if user.avatar.exists?
      return image_tag user.avatar.url(:medium),
                       id: 'image-preview',
                       class: 'img-responsive img-circle profile-image'
    end
    image_tag 'default-avatar.jpg', id: 'image-preview',
                                    class: 'img-responsive img-circle profile-image'
  end
end
