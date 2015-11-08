class Picture < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy

  belongs_to :user

  validates :name, length: { in: 2..100 }

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :image, presence: true

  def liked_by?(user)
    likes.map(&:user).include?(user)
    likes.any?{|like|like.user == user}
  end

  def find_like(user)
    likes.select do |like|
      like.user == user
    end.first
  end

end
