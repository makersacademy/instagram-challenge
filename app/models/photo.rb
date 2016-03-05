class Photo < ActiveRecord::Base
	has_attached_file :image,
	:styles => { :medium => "300x300>", 
		:thumb => "100x100>" }

		validates_attachment_content_type :image, { content_type: ["image/jpeg", 
			"image/gif", "image/png"] }

		end
