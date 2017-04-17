require 'rails_helper'
require_relative 'helpers'


feature 'commenting' do
  before {Picture.create name: 'visiting my friend'}

  scenario 'allows users to leave a comment using a form' do
     sign_up
     visit '/pictures'
     click_link 'Comment visiting my friend'
     fill_in "Comment", with: "so cool!"
     click_button 'Leave Comment'
     expect(current_path).to eq '/pictures'
     expect(page).to have_content('so cool!')
  end
end