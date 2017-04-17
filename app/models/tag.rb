class Tag < ActiveRecord::Base
  has_many :tagged_photos
  has_many :photos, through: :tagged_photos
end
