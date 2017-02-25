require 'rails_helper'

feature 'Dogs' do
  context 'no posts have been added' do
    scenario 'should display a prompt to post a photo' do
      visit 'posts/index'
      expect(page).to have_content 'No dogs yet'
      expect(page).to have_link 'Post a photo'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(name: 'Poppy')
    end
    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('Poppy')
      expect(page).not_to have_content('No dogs yet')
    end
  end
end
