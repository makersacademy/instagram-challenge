require 'rails_helper'

feature 'liking posts' do
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

  scenario 'a user can like a post, which updates the like endorsement count' do
    click_link 'Like Test'
    expect(page).to have_content('1 like')
  end

end
