require 'rails_helper'

feature 'posts' do

  context 'Users own posts' do
    before(:each) do
      sign_up
    end

    scenario 'can post a new image' do
      visit '/'
      click_link 'New Post'
      attach_file "Image", 'spec/support/fixtures/1.jpg'
      fill_in 'Caption', with: 'Dig that hole'
      click_button 'Create Post'
      expect(page).to have_content 'Dig that hole'
    end
  end
end