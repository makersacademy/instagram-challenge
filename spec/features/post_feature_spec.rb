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
      make_a_post
      within('li') do
        expect(page).to have_content 'test@email.com'
        expect(page).to have_selector("img[src*='testpattern.jpg']")
        expect(page).to have_content 'Test image'
      end
      expect(current_path).to eq '/posts'
    end
  end
end
