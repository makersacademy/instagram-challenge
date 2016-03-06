class Picture < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :postcomment, length: {maximum: 250}
end
