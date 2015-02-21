require 'rails_helper'
require_relative '../helpers/helper_methods.rb'

feature 'comments' do
  
  before do
    add_picture
  end
  
  scenario 'allows users to leave a comments on pictures' do
     visit '/pictures'
     click_link 'Comment'
     fill_in "comment", with: "TOTES!"
     click_button 'New Comment'

     expect(current_path).to eq '/restaurants'
     expect(page).to have_content('TOTES!')
  end

end