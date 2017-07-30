class Image < ActiveRecord::Base
  dragonfly_accessor :image do
    after_assign do |img|
      img.encode!('jpg', '-quality 80') if img.image?
    end
  end

  validates_presence_of :title

  validates_presence_of :image
  validates_size_of :image, maximum: 400.kilobytes,
                    message: "image exceeds 400KB", if: :image_changed?

  validates_property :format, of: :image, in: ['jpeg', 'jpg', 'png', 'gif'],
                    message: "valid formats: .jpeg, .jpg, .png, .gif", if: :image_changed?
end
