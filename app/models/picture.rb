class Picture < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy

  belongs_to :user

  validates :name, length: { in: 2..100 }

  has_attached_file :image, :styles => { :medium => "800x800>", :thumb => "600x600>" }, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :image, presence: true

  def liked_by?(user)
    likes.include?(user)
  end

  def find_like(user)
    likes.each do |like|
      return like if like.user == user
    end
  end

end
