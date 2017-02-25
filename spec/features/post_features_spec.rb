require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a link to add a post' do
      visit '/posts'
      expect(page).to have_link 'Create a post'
    end

    scenario 'display a message that there are no posts' do
      visit '/posts'
      expect(page).to have_content 'There are no posts yet!'
    end
  end

  context 'posts have been added' do
    before do
      create_post
    end

    scenario 'displaying posts' do
      visit '/posts'
      expect(page).to have_content 'I love summer'
      expect(page).not_to have_content 'There are no posts yet!'
    end
  end


end
