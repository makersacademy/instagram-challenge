require 'rails_helper'

feature 'commenting' do
  before do
    post_photo
  end

  scenario 'allows users to leave a comment using a form' do
     visit '/'
     click_link 'Comment'
     fill_in "Comment", with: "This is a comment."
     click_button 'Post Comment'

     expect(current_path).to eq '/'
     expect(page).to have_content('This is a comment.')
  end
end
