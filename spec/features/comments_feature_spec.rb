require 'rails_helper'

feature 'comments' do
  scenario 'allows users to comment' do
    sign_up
    upload_photo
     visit '/photos'
     click_link "A fun trip to the beach!"
     click_link 'Add comment'
     fill_in "Remark", with: "My favourite pic <3"
     click_button 'Post comment'

     expect(page).to have_content('My favourite pic <3')
  end
end
