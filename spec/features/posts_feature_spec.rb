require 'rails_helper'

feature "User can upload images as posts" do
  context 'creating posts' do
    scenario 'prompts user to fill out a form with an image, then displays the post' do
      visit '/posts'
      click_link 'New Post'
      fill_in 'Title', with: 'Iron Man Beta'
      attach_file('Image', Rails.root + "spec/fixtures/Iron-Man-Beta.jpg")

      click_button 'Create Post'
      expect(current_path).to eq '/posts'

      expect(page).to have_content 'Iron Man Beta'
      expect(page).to have_css("img[src*='Iron-Man-Beta.jpg']")

    end
  end
end
