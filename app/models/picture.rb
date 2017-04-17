class Picture < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_presence_of :title, :user
  validates_attachment :image, presence: true, size: { in: 0..1024.kilobytes }

  belongs_to :user
  has_many :comments
end