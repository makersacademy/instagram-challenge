require 'rails_helper'

feature 'commenting' do
  before do
    user_sign_up
    create_post
  end

  scenario 'allows users to leave a comment using a form' do
     visit '/posts'
     click_link 'Comment on First post'
     fill_in "Thoughts", with: "cool"
     click_button 'Post Comment'

     expect(current_path).to eq '/posts'
     expect(page).to have_content('cool')
  end

end
