require 'rails_helper'

feature 'post' do
  context 'no posts have yet been created' do
    scenario 'should have a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content('No posts to display')
      expect(page).to have_link('Add a post')
    end
  end

  context 'a post has been added' do
    before do
      Post.create(description: 'my lovely photo')
    end

    scenario 'should display the post in the index' do
      visit '/posts'
      expect(page).to have_content('my lovely photo')
      expect(page).not_to have_content('No posts to display')
    end
  end
end
