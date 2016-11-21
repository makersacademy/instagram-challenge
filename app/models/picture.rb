class Picture < ApplicationRecord
  has_many :likes, dependent: :destroy
  belongs_to :user

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def build_with_user(user)
    like = likes.build
    like.user = user
    like
  end
end
