class Post < ActiveRecord::Base
  has_attached_file :image, styles: { medium:  "500x" }
  validates_attachment :image, presence: true,
                               content_type: { content_type: "image/png" }
end
