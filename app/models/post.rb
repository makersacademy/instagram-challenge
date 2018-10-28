class Post < ApplicationRecord
  belongs_to :user
  has_many :comment
  has_attached_file :image, styles: {medium: "300x300", thumb:"100x100", large: '500x500'}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def find_email
    user.email
  end
end
