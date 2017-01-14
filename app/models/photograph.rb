class Photograph < ApplicationRecord
  has_many :comments, dependent: :destroy
end
