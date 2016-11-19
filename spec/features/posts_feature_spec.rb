require 'rails_helper'

describe 'Posts' do
  describe 'Posts#index' do
    scenario 'visitor sees homepage' do
      visit '/'
      expect(page).to have_content 'Instakilo - like Instagram, just a thousand times better'
    end
    scenario 'link takes visitor to posts#new' do
      visit '/'
      click_link 'Post photo'
      expect(current_path).to eq '/posts/new'
    end

    context 'no posts to display' do
      scenario 'visitor sees message' do
        visit '/'
        expect(page).to have_content 'No posts yet :\'('
      end
    end
    context 'posts to display' do
      before do
        post_photo
      end

      scenario 'no post messages absent' do
        expect(page).not_to have_content 'No posts yet :\'('
      end

      scenario 'displays caption' do
        expect(page).to have_content caption_text
      end

      scenario 'displays image' do
        expect(page).to have_css 'img[src*="kittens.jpg"]'
      end
    end
  end

  describe 'Posts#new' do
    context 'Posting' do
      scenario 'user submits with comment' do
        post_photo
      end
    end
  end
end