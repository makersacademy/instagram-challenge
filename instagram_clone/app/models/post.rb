class Post < ActiveRecord::Base

	has_attached_file :image, :styles => { :large => "500x500>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
  belongs_to :user
  has_many :comments, -> { extending WithUserAssociationExtension }, dependent: :destroy
  has_many :likes, -> { extending WithUserAssociationExtension }, dependent: :destroy

  validates :image, presence: { message: 'You have to post a picture!' }

  def belongs_to?(user)
  	user.posts.include?(self)
  end

  def liked_by?(user)
    user.liked_posts.include?(self)
  end

end
