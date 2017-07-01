require 'rails_helper'

feature 'posts' do

  context 'no posts available' do

    scenario 'should display a link to add a post' do
      visit ('/')
      expect(page).to have_content('No posts available')
      expect(page).to have_content('Add Post')
    end

  end

  context 'posts have been added' do

    before do
      Post.create(description: 'My fantastic dinner')
    end

    scenario 'display posts' do
      visit '/'
      expect(page).to have_content('My fantastic dinner')
      expect(page).not_to have_content('No posts available')
    end

  end

end
