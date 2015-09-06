class Picture < ActiveRecord::Base

has_many :likes, dependent: :destroy
validates :description, length: {minimum: 1}

end
