require 'rails_helper'

feature 'commenting' do
  before {Picture.create name: 'NCFC'}

  scenario 'allows users to leave a comment using a form' do
     visit '/pictures'
     click_link 'Comment on NCFC'
     fill_in "Comments", with: "so so"
     click_button 'Leave Comment'

     expect(current_path).to eq '/pictures'
     expect(page).to have_content('so so')
  end
end