
require 'rails_helper'
RSpec.describe Review, type: :model do
  context 'Validations' do

    before do
      Restaurant.create(name: 'The Fat Duck')
    end

    it 'cannot have a score below 1' do
      restaurant = Restaurant.first
      review = Review.new(rating: 0, restaurant_id: restaurant.id)
      expect(review).to have(1).error_on(:rating)
      expect(review).not_to be_valid 
    end

    it 'cannot have a score above 5' do
      restaurant = Restaurant.first
      review = Review.new(rating: 10, restaurant_id: restaurant.id)
      expect(review).to have(1).error_on(:rating)
      expect(review).not_to be_valid 
    end

  end
end
