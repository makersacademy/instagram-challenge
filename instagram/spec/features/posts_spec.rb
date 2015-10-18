require 'rails_helper'

feature 'posts' do

  before(:each) do
    user = FactoryGirl.create(:user)
    visit '/users/sign_in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  scenario 'posts can be created with image and caption' do
    visit '/posts'
    click_link 'New post'
    attach_file('Image', 'spec/features/test.jpg')
    fill_in('Caption', with:'This is the BBC')
    click_button 'Create Post'
    expect(page).to have_content('This is the BBC')

    #expect(page).to have_css("img[src*='test.jpg']")
  end
end
