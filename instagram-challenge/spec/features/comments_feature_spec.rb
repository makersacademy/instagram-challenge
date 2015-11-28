require 'rails_helper'

feature 'commenting' do
  before {Picture.create name: 'visiting my friend'}

  scenario 'allows users to leave a comment using a form' do
     visit '/pictures'
     click_link 'Comment visiting my friend'
     fill_in "comment", with: "so cool!"
     click_button 'Leave Comment'
     expect(current_path).to eq '/pictures'
     expect(page).to have_content('so cool!')
  end
end