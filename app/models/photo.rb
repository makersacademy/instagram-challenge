class Photo < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_presence :image

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user

  def build_comment(comment_params, current_user)
    comment = comments.create(comment_params)
    comment.user = current_user
    comment
  end

  def create_like(current_user)
    like = likes.create
    like.user = current_user
    like
  end

end
