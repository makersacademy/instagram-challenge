require 'rails_helper'

feature 'commenting' do
  before {Picture.create title: 'Pic 1'}

  scenario 'allows users to leave a comment using a form' do
     visit '/pictures'
     click_link 'Comment Pic 1'
     fill_in "Thoughts", with: "so so"
     click_button 'Leave Comment'

     expect(current_path).to eq '/pictures'
     expect(page).to have_content('so so')
  end

end
