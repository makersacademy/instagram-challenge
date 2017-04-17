class Post < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true   
  validates :image, presence: true
  has_attached_file :image, styles: { :large => "800x600", :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
