require 'rails_helper'

feature 'comments' do
  before { Image.create() }

  scenario 'allows users to leave a comment using a form' do
     visit '/images'
     click_link 'Comment'
     fill_in "Comments", with: "so so"
     click_button 'Leave Comment'

     expect(current_path).to eq '/images'
     expect(page).to have_content('so so')
  end

end
