class Photo < ApplicationRecord
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :image, attachment_presence: true
  validates :caption, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
end
