class Picture < ActiveRecord::Base
	has_many :comments,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy
	belongs_to :user
	validates :title, presence: true
	mount_uploader :image, ImageUploader
end
