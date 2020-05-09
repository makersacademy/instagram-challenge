class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  had_many :comments

  def filter_class
    "filter_#{filter.downcase}" unless filter.empty?
  end

  def formatted_time
    created_at.strftime("%-dth %b, %l:%M%P")
  end

  def username
    user.username
  end
end
