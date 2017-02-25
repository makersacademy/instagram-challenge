require 'rails_helper'
require 'web_helper'

feature 'comments' do
  before do
    sign_up
    create_new_image
  end

  scenario 'allows users to leave a comment using a form' do
     visit '/images'
     click_link 'Comment'
     fill_in "Comments", with: "so so"
     click_button 'Leave Comment'

     expect(current_path).to eq '/images'
     expect(page).to have_content('so so')
  end

end
