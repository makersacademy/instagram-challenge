class Picture < ActiveRecord::Base
  has_attached_file :picture, styles: { medium: "600x600>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  validates_attachment_presence :picture
  validates :picture_file_name, presence: true
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user

  def build_with_user(params, user)
    comment = self.comments.build(params)
    comment.user = user
    comment
  end

  def build_with_user2(user)
    like = self.likes.build
    like.user = user
    like
  end
end
