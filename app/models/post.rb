class Post < ApplicationRecord
    belongs_to :user

    has_one_attached :image

    validate :image_presence

    def image_presence
        errors.add(:image, "You forgot to attach an image") unless image.attached?
    end
end
