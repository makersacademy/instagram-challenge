require 'rails_helper'

feature 'commenting' do
  before { Picture.create caption: 'Hebrides' }

  scenario 'allows users to leave a comment using a form' do
     visit '/pictures'
     click_link 'Comment on Hebrides'
     fill_in "Thoughts", with: "lovely picture"
     click_button 'Leave Comment'

     expect(current_path).to eq '/pictures'
     expect(page).to have_content('lovely picture')
  end

end
