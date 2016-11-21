class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def owned_by?(user)
    user == self.user
  end

  def build_comment(attributes = {}, user)
    attributes[:user] ||= user
    comments.build(attributes)
  end
end
