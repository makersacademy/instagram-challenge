class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  def filter_class
    if filter != ""
      "filter_#{filter.downcase}"
    end
  end
end
