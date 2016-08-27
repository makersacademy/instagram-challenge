require 'rails_helper'
require 'features/feature_spec_helper'

feature 'posts' do
  before do
    sign_up
    new_post
  end

  context 'a user makes a post' do
    scenario 'the caption and image are displayed' do
      expect(page).to have_content('Amazing. #jackspoint #queenstown')
      expect(page).to have_css("img[src*='jackspoint.jpeg']")
    end

    scenario 'a new post contains the user_name of the user' do
      expect(page).to have_content('tc')
    end

    scenario 'a user can edit a post they made' do
      click_link 'profile'
      clink_link 'edit post'
      fill_in 'Caption', with: 'Mmmm dumplings'
      attach_file('Image', File.absolute_path('./public/system/posts/images/000/000/002/medium/dumpling.jpeg'))
      click_button 'Update Post'
      expect(page).to have_content('Mmmm dumplings')
      expect(page).to have_css("img[src*='dumpling.jpeg']")
    end
  end
end
