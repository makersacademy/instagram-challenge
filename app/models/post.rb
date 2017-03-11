class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user
  has_attached_file :image, :styles => { :medium => "370x370>", :thumb => "170x170>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def build_comment(attributes = {}, user)
   comment = comments.build(attributes)
   comment.user = user
   comment
 end

 def build_like(user)
  like = likes.build
  like.user = user
  like
end

end
