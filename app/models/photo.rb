class Photo < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "100x100>", large: "700x700" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
