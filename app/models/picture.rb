class Picture < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :name, length: { in: 2..100 }

end
