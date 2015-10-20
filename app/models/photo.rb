class Photo < ActiveRecord::Base
  has_attached_file :image, default_url: "/images/:style/missing.png", styles: { original: { height: "100%", width: "100%" } , medium:"300x300>", thumb:"100x100>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
  has_many :comments
  has_many :photo_likes
  has_many :tagged_photos
  has_many :tags, through: :tagged_photos

  # accepts_nested_attributes_for :tags
end
