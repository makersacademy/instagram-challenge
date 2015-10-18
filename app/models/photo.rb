class Photo < ActiveRecord::Base
  has_attached_file :image, default_url: "/images/:style/missing.png", styles: { original: { height: "50%", width: "50%" } , medium:"300x300>", thumb:"100x100>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
  has_many :comments
end
