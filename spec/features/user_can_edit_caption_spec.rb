# <p class='post-edit'><%= link_to 'Edit Post', edit_post_path(post) %></p>

require 'rails_helper'
require 'rake'

RSpec.feature 'Edit Caption', type: :feature do
  before do
    sign_up_helper
  end

  context 'A signed in user' do

    scenario 'can view edit caption page' do
      create_image('A lovely caption')
      click_on('Edit Caption')
      expect(page).to have_content('Editing Your Caption')
      expect(page).to have_selector('#image_caption')
    end

    scenario 'can edit an image caption' do
      create_image('I want to edit this caption')
      click_on('Edit Caption')
      fill_in 'image_caption', with: 'I\'ve edited this caption'
      click_on('Update Caption')
      expect(page).to have_content('I\'ve edited this caption')
    end
  end
end
