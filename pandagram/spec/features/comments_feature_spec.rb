require 'rails_helper'

feature 'commenting' do
  before { Post.create description: 'Night out' }

  scenario 'allows users to leave a comment using a form' do
     visit '/posts'
     click_link 'Leave a comment'
     fill_in 'User comment', with: "very nice!"
     click_button 'Leave a comment'

     expect(current_path).to eq '/posts'
     expect(page).to have_content("very nice!")
  end

end
