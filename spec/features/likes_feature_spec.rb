require 'rails_helper'

describe 'Liking reviews' do
  before do
    restaurant = Restaurant.create(name: 'Nobu')
    restaurant.reviews.create(rating: 3, review: 'Still reppin fo dem fishies all across the world')
  end

 xit 'users can say that a review is useful with an ascending useful count' do
    visit '/restaurants'
    click_link 'Useful'
    expect(page).to have_content('Useful 1')
  end
end
