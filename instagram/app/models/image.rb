class Image < ApplicationRecord
  has_many :comments,
  -> { extending WithUserAssociationExtension },
      dependent: :destroy
  belongs_to :user
  has_many :likes
  has_attached_file :image, :styles => {:medium => "400x400>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :caption, length: { maximum: 200 }
  validates :image, attachment_presence: true

  # def update_like_count(image)
  #   like = image.Like.create()
  #   like = Like.find(image.image_id)
  #   like.increment(:count)
  # end

end
