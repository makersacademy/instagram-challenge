require 'rails_helper'

feature 'commenting' do
  before { Post.create caption: 'picture' }

  scenario 'allows users to leave a comment using a form' do
     visit '/posts'
     click_link 'Comment picture'
     fill_in "Thoughts", with: "nice"
     click_button 'Leave Comment'

     expect(current_path).to eq '/posts'
     expect(page).to have_content('nice')
  end

end