class Picture < ActiveRecord::Base
  validates :user_id, presence: true
  has_attached_file :image, :styles => { :medium => "400x400>", :thumb => "100x100>"}
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  belongs_to :user
end
