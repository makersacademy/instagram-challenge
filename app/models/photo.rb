class Photo < ActiveRecord::Base
	belongs_to :user
	has_many :comments,
	dependent: :destroy
	has_many :likes
	has_attached_file :image,
	:styles => { :medium => "300x300>", 
		:thumb => "100x100>" }
		validates_attachment_content_type :image, { content_type: ["image/jpeg", 
			"image/gif", "image/png"] }


 def build_comment(attributes={}, user)
  attributes[:user_id] = user.id 
  comments.build(attributes)
  end


end
