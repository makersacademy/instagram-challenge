class Post < ActiveRecord::Base
  has_attached_file :image,
                    styles: { large: "600x600>", medium: "400x400>" },
                    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\Z}
end
