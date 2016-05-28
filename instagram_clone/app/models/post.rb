class Post < ActiveRecord::Base

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  belongs_to :user
  has_many :comments

  validates :image, presence: { message: 'You have to post a picture!' }

  def belongs_to?(user)
  	user.posts.include?(self)
  end

end
