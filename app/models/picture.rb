class Picture < ActiveRecord::Base

  belongs_to :user
  delegate :email, to: :user
  delegate :name, to: :user
  delegate :avatar, to: :user
  delegate :thoughts, to: :comment

  has_many :comments

  has_attached_file :image, styles: { large: "750x", medium: "600x", thumb: "100x" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_presence :image
  crop_attached_file :image

end