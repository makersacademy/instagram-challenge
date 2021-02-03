class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :caption, :image_url
  attribute :created_at do
    object.created_at.strftime("%H:%M %-d %B %Y")
  end

  def image_url
    p "in image_url method"
    if object.image.attached?
      p "object has an image attached"
      variant = object.image.variant(resize_to_fit: [210, 180])
      return rails_representation_url(variant, only_path: true)
    # else
    #   return "no image"
    end
  end

  belongs_to :user
end
