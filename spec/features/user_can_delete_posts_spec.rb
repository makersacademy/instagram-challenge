require 'rails_helper'
require 'rake'

RSpec.feature 'Upload Photo', type: :feature do
  before do
    sign_up_helper
  end

  context 'A signed in user' do
    scenario 'sees a delete post link' do
      create_image('A bad image')
      expect(page).to have_content('A bad image')
      expect(page).to have_selector('a#delete-link')
    end

    scenario 'can delete their own post' do
      create_image('A bad image')
      click_link('Delete Post')
      expect(page).not_to have_css("img[src*='image.jpg']")
      expect(page).not_to have_content('A bad image')
    end
  end
end
