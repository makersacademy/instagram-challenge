require 'rails_helper'

describe 'Reviews' do
  before do
    Restaurant.create(name: 'The Fat Duck',
                      description: '3 Michelin Stars')
  end

  context 'Adding a review' do
    it 'can leave a review' do
      leave_review('Expensive foodgasm', 5)
      expect(current_path).to eq '/restaurants'
      expect(page).to have_content 'Expensive foodgasm'
      expect(page).to have_content 'Rating: 5'
    end

    it 'review appears on show page' do
      leave_review('Expensive foodgasm', 5)
      click_link 'The Fat Duck'
      expect(current_path).to match /restaurants\/\d/ 
      expect(page).to have_content 'Expensive foodgasm'
      expect(page).to have_content 'Rating: 5'
    end

    it 'can provide an average rating' do
      leave_review('Amazing', '5')
      leave_review('Amazing but expensive', '3')
      expect(page).to have_content('Average rating: ★★★★☆')
    end

    def leave_review(review, rating)
      visit '/restaurants'
      click_link 'Review The Fat Duck'
      fill_in 'Your review', with: 'Expensive foodgasm'
      select rating, from: 'Rating' 
      click_button 'Leave review'
    end
  end
end
