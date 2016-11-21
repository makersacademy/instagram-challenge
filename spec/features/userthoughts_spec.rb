require 'rails_helper'

feature 'commenting on pics' do
  before { Picture.create name: 'Awesome pic!' }

  scenario 'allows users to leave a thought using a form' do
     visit '/pictures'
     click_link 'Review Awesome pic!'
     fill_in "Thoughts", with: "Awesome!"
     select '3', from: 'Rating'
     click_button 'Leave Review'

     expect(current_path).to eq '/pictures'
     expect(page).to have_content('Awesome!')
  end

end
