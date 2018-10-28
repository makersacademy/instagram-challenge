require 'rails_helper'
require 'rake'

RSpec.feature 'Like Posts', type: :feature do
  before do
    sign_up_helper
  end

  context 'A signed in user' do

    scenario 'Sees a like button for every image' do
      create_image('A good image')
      create_image('A great image!')
      expect(page).to have_selector('input#like-button')
    end

    scenario 'Sees a like count for every image' do
      create_image('I want to like this image')
      expect(page).to have_selector('p.like-count')
    end

    scenario 'likes an image and the like count increases by one' do
      create_image("I want to like this image")
      click_on('Like')
      expect(page).to have_content('1 Like')
    end

    scenario 'likes many images and the like count increases by many' do
      create_image("I want to like this image")
      click_on('Like')
      click_on('Like')
      click_on('Like')
      expect(page).to have_content('3 Likes')
    end
  end

end
