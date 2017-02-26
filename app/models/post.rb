class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user
  has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "200x200>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def build_comment(attributes = {}, user)
   comment = comments.build(attributes)
   comment.user = user
   comment
 end

end
