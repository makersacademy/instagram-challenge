require 'rails_helper'

feature 'commenting' do
  before { create_post }

  scenario 'allows users to leave a comment using a form' do
     visit '/posts'
     click_link 'Comment on First post'
     fill_in "Thoughts", with: "cool"
     click_button 'Post Comment'

     expect(current_path).to eq '/posts'
     expect(page).to have_content('cool')
  end

end
