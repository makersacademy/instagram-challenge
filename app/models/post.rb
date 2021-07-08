class Post < ApplicationRecord
	belongs_to :user
	has_many :comments
	has_many :likes

	has_attached_file :image, styles: {
		small: "64x64",
		med: "200x200",
		large: "400x400"
	}

	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
	
	def posted_at
		created_at.localtime.strftime("%H:%M (%d/%m/%y)")
	end


end
