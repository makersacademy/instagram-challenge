class Post < ActiveRecord::Base
  has_many :comments,
      -> { extending WithUserAssociationExtension },
      dependent: :restrict_with_exception,
      dependent: :destroy
  has_many :likes,
      -> { extending WithUserAssociationExtension },
      dependent: :restrict_with_exception,
      dependent: :destroy
  belongs_to :user

  has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "250x250>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_presence :image, message: 'is required'

  def has_posted?(current_user)
    self.user == current_user
  end

  def likes_count
    return 'No Likes' if likes.none?
    "Likes: #{likes.count}"
  end

  def has_been_liked?(current_user)
    like_by(current_user).length > 0
  end

  def like_by(current_user)
    (likes&current_user.likes)
  end
end
