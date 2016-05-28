class Comment < ActiveRecord::Base

	belongs_to :post
	belongs_to :user

	def belongs_to?(user)
  	user.comments.include?(self)
  end

end
