require 'rails_helper'
RSpec.describe "Creating posts", :type => :feature do
  
  feature 'Add post' do
    scenario 'User can not add a post if not signed in' do
      visit '/'
      click_link 'New post'
      expect(page).not_to have_content "My fave cat"
      expect(page.current_path).to eq '/users/sign_in'
    end
  end

  feature 'Add post' do
    before do
      login
    end

    scenario "User adds a post and post is displayed" do
      add_post('My fave cat', Rails.root.join('spec/images/cat.jpg'))
      expect(page).to have_css("img[src*='cat.jpg']")
      expect(page).to have_content('My fave cat')
      expect(page).to have_content('Posted babes <3')
    end
    scenario 'it will not allow post to be created without an image' do
      add_post('My fave cat', nil)
      expect(page).to have_content('Ya got 1 error bbz')
      expect(page).to have_content('Whoops, looks like you forgot to include your image')
    end
    scenario 'it will not allow post to be created caption over 100 chars long and raises multiple errors' do
      add_post('My fave cat, My fave cat, My fave cat, My fave cat,My fave cat, My fave cat, My fave cat, My fave cat, My fave cat, My fave cat, My fave cat, My fave cat,My fave cat, My fave cat, My fave cat, My fave cat, My fave cat, My fave cat,My fave cat, My fave cat, My fave cat, My fave cat', nil)
      expect(page).to have_content('Ya got 2 errors bbz')
      expect(page).to have_content('Your caption is too long m8, only 100 chars tops, soz')
      expect(page).to have_content('Whoops, looks like you forgot to include your image')
    end
  end
end
