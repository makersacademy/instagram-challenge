require 'rails_helper'

feature 'reviewing' do
  before {Picture.create name: 'LIKE'}

  scenario 'allows users to leave a review using a form' do
     visit '/pictures'
     click_link 'Review LIKE'
     fill_in "Thoughts", with: "so so"
     click_button 'Leave Review'

     expect(current_path).to eq '/pictures'
     expect(page).to have_content('so so')
  end

end