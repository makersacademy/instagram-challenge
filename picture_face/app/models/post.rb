class Post < ActiveRecord::Base

  has_many :comments
  validates :title, length: { minimum: 3 }
  validates :image, presence: true

  has_attached_file :image, styles: { :medium => "640x", :thumb => "200x200" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
