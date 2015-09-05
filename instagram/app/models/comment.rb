class Comment < ActiveRecord::Base
	belongs_to :photo

	validates :comment, length: {minimum: 1}
end
