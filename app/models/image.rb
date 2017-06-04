class Image < ActiveRecord::Base
  has_attached_file :image,
    styles: { medium: "300x300>", thumb: "100x100>" }
    
  validates_attachment_content_type :image, :content_type => ['image/jpg', 'image/jpeg', 'image/png']

  belongs_to :user
  has_many :comments
end
