require 'rails_helper'

feature 'likes' do

  scenario 'allows users to "like" an image' do
     sign_up
     upload_image
     click_link 'Like'
     expect(current_path).to eq '/images'
     expect(page).to have_content('1 like')
  end

end