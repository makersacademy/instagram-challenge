class InstaPost < ApplicationRecord
has_attached_file :insta_image
validates_attachment_content_type :insta_image, :content_type => /\Aimage\/.*\z/

end
