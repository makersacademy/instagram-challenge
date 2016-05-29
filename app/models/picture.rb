class Picture < ActiveRecord::Base
	acts_as_votable
	has_many :comments,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy
	belongs_to :user
	validates :title, presence: true
	mount_uploader :image, ImageUploader
end
