class Post < ApplicationRecord
	belongs_to :user
	has_many :endorsements
	has_many :comments, dependent: :destroy
	has_attached_file :image, styles: { high: "600x600>", medium: "300x300>", thumb: "100x100#" }, default_url: "/images/normal/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
