class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  def filter_class
    "filter_#{filter.downcase}"
  end
end
