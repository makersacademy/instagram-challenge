class Photo < ApplicationRecord

  belongs_to :user
  has_many :likes
  has_many :comments

  validates :description, presence: true

  has_attached_file :image, styles: { medium: "1200x1200>" }, default_url: "/images/default.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def count_likes
    Like.where("photo_id = #{self.id}").count
  end

end
