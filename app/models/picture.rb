class Picture < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :postcomment, length: {maximum: 250}
end
