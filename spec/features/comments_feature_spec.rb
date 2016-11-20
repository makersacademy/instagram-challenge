require 'rails_helper'

feature 'commenting on a picture' do

  before do
    sign_in('test@test.com', 'testpassword')
    add_picture('Kitty cat')
  end

  scenario 'users can leave a comment' do
    visit_picture('Kitty cat')
    click_link 'Comment'
    fill_in "Comment", with: "Such a gorgeous pussycat"
    click_button 'Post comment'
    expect(current_path).to eq '/pictures'
    click_link 'Kitty cat'
    expect(page).to have_content('Such a gorgeous pussycat')
  end
end
