class Post < ActiveRecord::Base
  validates :user_id, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy


  has_attached_file :image, styles: { :medium => "640x" }

  validates :image, presence: true

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def owned_by?(user)
    user == self.user
  end

end
