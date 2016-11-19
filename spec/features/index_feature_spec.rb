require 'rails_helper'

describe 'Posts#Index' do
  context 'on the home page' do
    scenario 'visitor sees homepage' do
      visit '/'
      expect(page).to have_content 'Instakilo - like Instagram, just a thousand times better'
    end
    scenario 'link takes visitor to posts#new' do
      visit '/'
      click_link 'Post photo'
      expect(current_path).to eq '/posts/new'
    end
  end

  context 'no posts to display' do
    scenario 'visitor sees message' do
      visit '/'
      expect(page).to have_content 'No posts yet :\'('
    end
  end
end