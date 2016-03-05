require 'rails_helper'

feature 'Uploading and Viewing posts' do
  scenario 'no posts yet' do
    visit '/'
    expect(page).to have_content 'No posts, upload one!'
  end

  context 'uploading posts' do
    before do
      sign_up
    end

    scenario 'user can upload posts' do
      visit '/'
      click_link 'Post a photo'
      attach_file 'post[image]',
                  Rails.root.join('spec', 'fixtures', 'testpattern.jpg')
      fill_in 'Caption', with: 'Test image'
      click_button 'Post'
      expect(page).to have_content 'Test image'
      expect(page).to have_selector("img[src*='testpattern.jpg']")
      expect(current_path).to eq '/posts'
    end
  end
end
