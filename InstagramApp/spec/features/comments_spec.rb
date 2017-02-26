require 'rails_helper'

feature 'Commenting a post' do
  before { Post.create title: 'POST1', content: 'Week1 post', id: 1 }
  scenario 'allows users to leave a comment using a form' do
     sign_up
     click_link 'Comment Post'
     fill_in "Content", with: "Great post"
     click_button 'Leave Comment'
     click_link 'View Post'
     expect(page).to have_content('Great post')
  end

end
