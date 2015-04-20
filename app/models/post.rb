class Post < ActiveRecord::Base
  has_attached_file :image, :styles => {:large => "600x600>", :medium => "300x300>", :thumb => "150x150#" }
  validates_attachment :image,
  :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }

  has_many :comments, dependent: :destroy
  belongs_to :user

end
