require 'rails_helper'

feature 'commenting' do
  before { Post.create title: 'POST1', content: 'Week1 post', id: 1 }
  scenario 'allows users to leave a comment using a form' do
     visit '/posts'
     click_link 'Comment Post'
     fill_in "Content", with: "Have a good day"
     click_button 'Leave Comment'
     click_link 'View Post'
     expect(page).to have_content('Have a good day')
  end

end
