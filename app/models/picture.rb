class Picture < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true

  has_attached_file :image, :styles => { :standard => "680x400>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def show_likes
    self.likes
  end

  def show_comments
    total_comments = Comment.where(picture_id: self)
    return total_comments.size
  end

end
