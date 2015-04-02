require 'rails_helper'

RSpec.describe Restaurant, type: :model do

  let(:restaurant) {Restaurant.create(name: "Nobu")}

  context 'Validations' do
    it 'is not valid with a name fewer than 3 chars' do
      invalid_restaurant = Restaurant.new(name: 'Th')
      expect(invalid_restaurant).to have(1).error_on(:name)
      expect(invalid_restaurant).not_to be_valid 
    end

    it 'can only create a restaurant with a unique name' do
      restaurant # needed to invoke the proc
      invalid_restaurant = Restaurant.new(name: 'Nobu')
      expect(invalid_restaurant).to have(1).error_on(:name)
    end
  end

    context '#average rating' do
      it 'shows N/A when no reviews' do
        expect(restaurant.average_rating).to eq 'N/A'
      end

      it 'shows a number when one review' do
        restaurant.reviews.create(rating: 4)
        expect(restaurant.average_rating).to eq 4
      end

      it 'shows an average when many reviews' do
        restaurant.reviews.create(rating: 5)
        restaurant.reviews.create(rating: 3)
        restaurant.reviews.create(rating: 1)
        expect(restaurant.average_rating).to eq 3
      end
    end
  
end
