require 'rails_helper'

feature 'Feature - likes' do
  before  do
    sign_up
    add_a_picture
    sign_out
    sign_up("seconduser", "second@somewhere.com", "123456")
  end

  context 'liking a picture' do
    scenario 'any user can Like a picture' do
      click_link 'Like'
      expect(current_path).to eq '/pictures'
      expect(page).to have_content '1 Like'
    end

    scenario 'user cannot Like a picture more than once' do
     click_link 'Like'
     click_link 'Like'
     expect(page).to have_content "You have already Liked this picture"
    end
  end
end
