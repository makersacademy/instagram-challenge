class Post < ActiveRecord::Base
  validates :image, presence: true

  has_attached_file :image { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
