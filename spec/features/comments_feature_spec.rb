require 'rails_helper'

feature 'commenting' do
  before { Pic.create title: 'mymoment' }

  scenario 'allows users to leave a comment using a form' do
     visit '/pics'
     click_link 'Comment mymoment'
     fill_in "Thoughts", with: "cool"
     click_button 'Leave Comment'

     expect(current_path).to eq '/pics'
     expect(page).to have_content('cool')
  end

end
