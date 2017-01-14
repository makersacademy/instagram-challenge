class Photo < ApplicationRecord
  has_many :comments, dependent: :destroy
end
