require 'rails_helper'

feature 'commenting' do
  before do
    sign_up_test
    create_post
  end

  scenario 'allows users to leave a comment using a form' do
     click_link('Sign out')
     sign_up_test(email:'test2@example.com', user_name: 'seconduser')
     visit '/posts'
     click_link 'Add comment'
     fill_in "Comment", with: "Awesome pic"

     click_button 'Leave comment'
     visit '/posts'
     expect(page).to have_content('Comments: 1')
     expect(page).to have_content("Awesome pic")
  end

end
