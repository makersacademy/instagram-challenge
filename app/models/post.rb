class Post < ActiveRecord::Base
  has_attached_file :image
  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  belongs_to :user
  has_many :comments, dependent: :destroy

  def get_comments(post_id)
  Comment.where(post_id: post_id)
end

end
