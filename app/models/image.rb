class Image < ApplicationRecord

  belongs_to :user
  has_many :comments

  validates :title, length: { minimum: 3 }
  validates :description, presence: true
  has_attached_file :image_file, :styles => { :large => "600x600", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/missing.png"
  validates_attachment :image_file, presence: true,
                       content_type: { :content_type => ["image/jpeg", "image/jpg", "image/png"]}

end
