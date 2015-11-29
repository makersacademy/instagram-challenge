require 'rails_helper'

feature 'commenting' do
  before {Post.create caption: 'big ass cakes'}

  scenario 'allows users to leave a comment using a form' do
     visit '/posts'
     click_link 'Add comment to big ass cakes'
     fill_in "Comment", with: "Much too nice for cake"
     select '3', from: 'Hotornot'
     click_button 'Leave Comment'

     expect(current_path).to eq '/posts'
     expect(page).to have_content('Much too nice for cake')
  end

end