class Post < ApplicationRecord

  validates :caption, presence: true

  has_one_attached :image

  belongs_to :user
  has_many :likes, dependent: :destroy

  def like(user)
    likes << Like.new(user: user)
  end

  def unlike(user)
    likes.where(user_id: user.id).first.destroy
  end


end
