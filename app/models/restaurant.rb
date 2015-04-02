class Restaurant < ActiveRecord::Base

  has_many :reviews, dependent: :destroy

  validates :name, length: {minimum: 3, message: "The restaurant name is too short"}, 
    uniqueness: {message: "Restaurants must have a unique name"}

  def average_rating
    return 'N/A' if reviews.none?
    reviews.average(:rating)
  end
end
