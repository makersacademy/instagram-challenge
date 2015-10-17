class Picture < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  validates :name, length: { in: 2..100 }
  
end
