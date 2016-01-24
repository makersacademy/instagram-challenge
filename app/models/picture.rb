class Picture < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :likes
  belongs_to :user
  has_attached_file :image,
  styles: { medium: "300x300>", thumb: "100x100>" }

  validates :image, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
