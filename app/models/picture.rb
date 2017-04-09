class Picture < ActiveRecord::Base
  validates :user_id, presence: true
  has_attached_file :image, :styles => { :medium => "640x", :thumb => "100x100>"}
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  belongs_to :user
  has_many :comments, dependent: :destroy
end
