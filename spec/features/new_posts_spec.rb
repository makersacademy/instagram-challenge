require 'rails_helper'

RSpec.feature 'New Posts', type: :feature do
  context 'A user has logged in' do
    before do
      sign_up
    end

    scenario 'The user can submit a post with a picture and description' do
      make_a_post
      expect(current_path).to eq('/posts')
      expect(page.status_code).to eq(200)
      expect(page.find('.posts-index-userName')).to have_content('natgeo')
      expect(page).to have_css 'img.posts-index-picture'
      expect(page).to have_content('Humming birds taking a bath')
    end
  end

  context 'A user has not logged in' do
    scenario 'The user is asked to sign in or sign up' do
      visit '/posts/new'
      expect(page).not_to have_button('Save Post')
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end
end
