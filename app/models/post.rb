class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  def create


  end
end
