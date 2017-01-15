class Picture < ApplicationRecord

	has_many :comments, dependent: :destroy

end
