class Picture < ActiveRecord::Base
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  validates_attachment_presence :picture
  validates :picture_file_name, presence: true
  has_many :comments, dependent: :destroy
  belongs_to :user

end
