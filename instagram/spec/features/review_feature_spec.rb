require 'rails_helper'

feature 'reviewing' do
  before { Photo.create comment: 'cool' }

  scenario 'allows users to leave a review using a form' do
     visit '/photos'
     click_link 'Review cool'
     fill_in "Thoughts", with: "so so"
     click_button 'Leave Review'

     expect(page).to have_content('so so')
  end

end
