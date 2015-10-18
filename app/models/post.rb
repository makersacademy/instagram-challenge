class Post < ActiveRecord::Base
  
  has_attached_file :image,
                    styles: { small: "100x100", med: "300x300", large: "original" },
                    path: ":rails_root/public/user_uploads/images/:id/:style/:basename.:extension",
                    url: "/controllers/:style/:basename.:extension"

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  belongs_to :user

end
