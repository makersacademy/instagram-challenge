require 'rails_helper'

feature 'commenting' do
  before { Post.create title: 'Pug' }

  scenario 'allows users to leave a comment using a form' do
     visit '/posts'
     click_link 'Comment'
     fill_in "Comment", with: "ADORABLE"
     click_button 'Leave Comment'

     expect(current_path).to eq '/posts'
     expect(page).to have_content('ADORABLE')
  end

end
