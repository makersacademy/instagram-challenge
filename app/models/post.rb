class Post < ActiveRecord::Base
  
  Paperclip.interpolates :user_id do |attachment, style|
    "all_posts" # => user_#{attachment.instance.user_id}"
  end

  has_attached_file :image,
                    styles: { small: "400x400", med: "700x700", large: "original" },
                    path: ":rails_root/public/images/user_uploads/:user_id/:id/:style/:basename.:extension",
                    url: "/images/user_uploads/:user_id/:id/:style/:basename.:extension"

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  belongs_to :user
  has_many :comments

end
