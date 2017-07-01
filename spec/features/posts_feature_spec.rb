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

  context 'create posts' do

    scenario 'user fills a form to create a post and then displays the post' do
      visit '/'
      click_link 'Add Post'
      fill_in 'Description', with: 'My fantastic dinner'
      click_button 'Create Post'
      expect(page).to have_content 'My fantastic dinner'
      expect(current_path).to eq '/'
    end
    
  end

end
