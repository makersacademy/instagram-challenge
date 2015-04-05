class Post < ActiveRecord::Base

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_attached_file :image, styles: { medium: "300x300>" }
  # validates_attachment_presence :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def create_comment(user, params)
    new_comment = comments.build(params)
    new_comment.user = user
    new_comment.save
    new_comment 
  end

end