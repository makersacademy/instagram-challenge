class Post < ApplicationRecord

  validates :description, presence: true
  validates :image, presence: true

  has_many :comments, dependent: :destroy

  has_attached_file :image, :styles => { medium: "autoxauto>", thumb: "300x300>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
