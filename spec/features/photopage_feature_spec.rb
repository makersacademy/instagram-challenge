require 'rails_helper'

feature 'photos' do
  context 'no pictures have been added' do
    scenario 'should display prompt to add photos' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'pictures have been added' do
    before do
      Post.create(caption: 'first post')
    end
    scenario 'display pictures' do
      expect(page).to have_content 'first post'
    end
  end

end
