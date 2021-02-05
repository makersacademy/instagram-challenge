class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :caption, :image_url
  attribute :created_at do
    object.created_at.strftime("%H:%M %-d %B %Y")
  end

  def image_url
    if object.image.attached?
      variant = object.image.variant(resize_to_fit: [210, 180])
      return rails_representation_url(variant, only_path: true)
    end
  end

  belongs_to :user
end
