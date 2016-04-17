require 'rails_helper'

feature 'Likes' do

  before (:each) do
    sign_up_jinis
    post_picture_with_image
  end

  scenario 'user can like a picture' do
    visit_picture
    click_link 'Like'
    expect(Like.count).to eq 1
    expect(page).to have_content 'Likes: 1'
  end

  scenario 'user must be signed in to like a picture' do
    click_link 'Sign out'
    visit_picture
    expect(page).not_to have_link 'Like'
  end

  context 'When user has already liked the picture' do

    before (:each) do
      visit_picture
      click_link 'Like'
    end

    scenario 'user cannot see like link if already liked the picture' do
      expect(page).not_to have_link 'Like'
    end

    scenario 'picture page has Unlike link' do
      click_link 'Unlike'
      expect(page).to have_content 'Likes: 0'
      expect(page).to have_link 'Like'
    end
  end
end
