class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments
  has_many :likes
  validates :title, length: { minimum: 3 }
  validates :image, presence: true

  has_attached_file :image, styles: { :medium => "640x", :thumb => "200x200" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


  def build_comment_with_user(comment_params, current_user)
    comment = self.comments.build(comment_params)
    comment.user = current_user
    comment
  end

  def last_three_comments
    rev_three = comments.reverse
    rev_three[0..2]
  end

  def reversed_comments
    comments.reverse
  end

end
