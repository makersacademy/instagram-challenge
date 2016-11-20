class Post < ActiveRecord::Base
  validates :image, presence: true
  validates :tag, presence: true

  has_attached_file :image, styles: {medium: "300"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :User
end
