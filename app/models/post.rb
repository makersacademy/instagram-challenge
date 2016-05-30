class Post < ActiveRecord::Base
  validates :image, presence: true
  validates :user_id, presence: true
  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
  has_many :comments, dependent: :destroy
end