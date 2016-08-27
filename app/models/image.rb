class Image < ActiveRecord::Base
  validates :title, length: {maximum: 50}

  belongs_to :user
  has_many :comments, dependent: :destroy
end
