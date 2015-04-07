require 'rails_helper'

feature 'commenting' do
  before {Post.create title: 'Me and my dog'}

  scenario 'allows users to leave a comment using a form' do
     visit '/posts'
     click_link 'Leave comment'
     fill_in "Text", with: "Cool dogg"
     click_button 'Leave Comment'

     expect(current_path).to eq '/posts'
     expect(page).to have_content('Cool dogg')
  end

end