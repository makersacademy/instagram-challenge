require 'rails_helper'

feature 'commenting' do
  before {Image.create caption: 'Test caption'}

  scenario 'allows users to leave a comment using a form' do
     visit '/images'
     fill_in "Message", with: "Test comment"
     click_button 'Leave Comment'

     expect(current_path).to eq '/images'
     expect(page).to have_content('Test comment')
  end

end
