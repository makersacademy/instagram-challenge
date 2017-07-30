class Picture < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes

  has_attached_file :image, styles: { medium: "700x", thumb: "250x250>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :user_id, presence: true
  validates :image, presence: true

end
