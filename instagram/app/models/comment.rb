class Comment < ActiveRecord::Base
	belongs_to :photo
	belongs_to :user

	validates :comment, length: {minimum: 1, maximum: 150}
end
