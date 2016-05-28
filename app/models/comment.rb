class Comment < ActiveRecord::Base
	validates :content, presence: true
end
