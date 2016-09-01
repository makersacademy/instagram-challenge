require 'rails_helper'

feature 'commenting' do
  before do
    visit '/'
    user = FactoryGirl.create(:user)
    login_as(user)
    click_link 'New Post'
    fill_in 'Title', with: 'Test'
    attach_file 'Image', './spec/images/test.jpg'
    fill_in 'Description', with: 'Test'
    click_button 'Create Post'
  end

  scenario 'allows users to leave a comment using a form' do
     visit '/'
     click_link 'Comment on Test'
     fill_in "Thoughts", with: "Much great picture"
     click_button 'Leave Comment'
     expect(current_path).to eq '/posts'
     expect(page).to have_content('Much great picture')
  end

end
