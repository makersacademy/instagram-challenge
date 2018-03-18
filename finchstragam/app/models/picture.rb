class Picture < ApplicationRecord
  validates_presence_of :link, :description

  belongs_to :user
  has_many :comments
end
