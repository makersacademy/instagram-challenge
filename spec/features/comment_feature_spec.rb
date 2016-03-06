require 'rails_helper'

feature 'commenting' do
  before {Photo.create description: 'The Beach'}

  scenario 'allows users to leave a comment on a photo' do
     visit '/photos'
     click_link 'Comment'
     fill_in "Thoughts", with: "so cool"
     click_button 'Comment'

     expect(current_path).to eq '/photos'
     expect(page).to have_content('so cool')
  end

end
