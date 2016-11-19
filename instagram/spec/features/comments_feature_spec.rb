require 'rails_helper'

feature 'commenting' do
  before { Post.create caption: 'Devon sunset' }

  scenario 'allows users to leave a comment using a form' do
     visit '/posts'
     click_link 'Review Devon sunset'
     fill_in "Thoughts", with: "beautiful"
     click_button 'Leave Comment'
     expect(current_path).to eq '/posts'
     expect(page).to have_content('beautiful')
  end

end
