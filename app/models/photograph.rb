class Photograph < ApplicationRecord
  belongs_to :user
  validates :aws_key, presence: true
end
