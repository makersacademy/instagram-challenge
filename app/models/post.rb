class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :image, presence: true

  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def self.reverse_order
    all.reverse
  end

  def posted_at
    created_at.localtime.strftime("%H:%M (%d/%m/%y)")
  end

  def like
    "Like".pluralize(likes.count)
  end

  def like_count
    likes.count
  end

end
