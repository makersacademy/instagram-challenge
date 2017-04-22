require 'rails_helper'

feature 'Adding comments' do
  before do
    sign_up
    upload_post
  end

  scenario 'allows users to leave a comment using a form' do
     visit '/'
     click_link 'Add a comment'
     fill_in "Comment", with: "Great photo!"
     click_button('Create Comment')

     expect(current_path).to eq '/posts'
     expect(page).to have_content('Great photo!')
  end

end
