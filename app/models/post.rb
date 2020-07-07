class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  delegate :username, to: :user 

  def filter_class
    "filter_#{filter.downcase}" unless filter.empty?
  end

  def formatted_time
    created_at.strftime("%-dth %b, %l:%M%P")
  end
end
