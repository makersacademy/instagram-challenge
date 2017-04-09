class Post < ActiveRecord::Base
  has_attached_file :image,
                    :storage => :cloudinary,
                    styles: { medium: "300x300>" },
                    :path => ':id/:style:/filename',
                    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
