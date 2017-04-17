class Post < ActiveRecord::Base
  has_attached_file :pics, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :pics, content_type: /\Aimage\/.*\z/

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
