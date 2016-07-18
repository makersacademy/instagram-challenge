class Post < ApplicationRecord

  has_many :comments, dependent: :destroy

  has_attached_file :image, :styles => { :large => "600x600",
                                         :medium => "300x300",
                                         :small => "150x150",
                                         :thumb => "100x100",
                                         :default_url => "/images/:style/missing.png"}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :caption, length: { minimum: 3 }
  validates :image, presence: true
end
