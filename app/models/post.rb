class Post < ApplicationRecord
  belongs_to  :user
  has_many :comments, -> { extending WithUserAssociationExtension  }, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy
  has_attached_file :image, default_url: '/images/missing.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def calculate_rating
    likes.size - dislikes.size
  end

  def update_rating
    update(rating: calculate_rating)
  end

  def likes_for?(user)
    if likes.where(user: user).empty?
      false
    else
      likes.where(user: user)
    end
  end

  def likes_for(user)
    likes.where(user: user)
  end

  def dislikes_for?(user)
    if dislikes.where(user: user).empty?
      false
    else
      dislikes.where(user: user)
    end
  end

  def dislikes_for(user)
    dislikes.where(user: user)
  end
end
