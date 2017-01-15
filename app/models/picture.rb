class Picture < ApplicationRecord

  belongs_to :user
  has_many :comments
  has_many :likes

  has_attached_file :image, :styles => { :medium => "600x700>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def build_comment(attributes ={}, user)
    comment = comments.build(attributes)
    comment.user = user
    comment
  end

end
