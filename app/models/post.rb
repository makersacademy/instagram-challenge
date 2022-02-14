class Post < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :account
    scope :active, -> { where active: true}

    before_create :set_active

    def set_active
        self.active = true
    end
end
