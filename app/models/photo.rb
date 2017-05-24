class Photo < ApplicationRecord

  belongs_to :user
  delegate :username, to: :user
  delegate :email, to: :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_attached_file :image, :styles => { :large => "1080x1080>", :thumb => "600x600" }, :default_url => "http://i234.photobucket.com/albums/ee136/suwarnaadi/hair/rick-astley-80s-hairstyle.jpg"

  validates :image, presence: true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def create_comment(comment_params, user)
    comment = user.comments.new(comment_params)
    comment.update(photo_id: self.id)
    comment.save
  end

  def new_like(user)
    like = user.likes.new
    like.update(photo_id: self.id)
    like.save
  end
end
