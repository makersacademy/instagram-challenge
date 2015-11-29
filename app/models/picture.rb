class Picture < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :name, uniqueness: true
end
