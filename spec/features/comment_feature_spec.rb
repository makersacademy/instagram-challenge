require 'rails_helper'

feature 'commenting' do
  before { Photo.create caption: 'KFC' }

  scenario 'allows users to leave a comment using a form' do
     visit '/photos'
     click_link 'Leave a Comment'
     fill_in "Thoughts", with: "so so"
     click_button 'Comment'

     expect(current_path).to eq '/photos'
     expect(page).to have_content('so so')
  end

end
