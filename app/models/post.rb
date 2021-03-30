class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :likes, dependent: :destroy

  def like_button
    if likes.count.zero?
      '🤍'
    else
      '❤️'
    end
  end
end
