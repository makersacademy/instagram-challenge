require 'rails_helper'

feature 'commenting on a picture' do
  before { Picture.create description: 'Kitty cat' }
  scenario 'users can leave a comment' do
     visit '/pictures'
     click_link 'Kitty cat'
     click_link 'Comment'
     fill_in "Comment", with: "Such a gorgeous pussycat"
     click_button 'Post comment'
     expect(current_path).to eq '/pictures'
     click_link 'Kitty cat'
     expect(page).to have_content('Such a gorgeous pussycat')
  end
end
