require 'rails_helper'

feature 'commenting' do
  before { Post.create description: 'Holiday' }

  scenario 'allows users to leave a comment using a form' do
     visit '/posts'
     click_link 'Comment on Holiday'
     fill_in "Comment", with: "Nice photo"
     click_button 'Leave comment'

     expect(current_path).to eq '/posts'
     expect(page).to have_content('Nice photo')
  end

end
