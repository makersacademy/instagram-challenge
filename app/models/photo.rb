class Photo < ApplicationRecord
    mount_uploader :image_file, PhotoUploader
    belongs_to :user
    validates :title, :image_file, presence: true
end
