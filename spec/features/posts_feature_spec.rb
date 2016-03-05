require 'rails_helper'

feature 'Posts' do

  context 'no pictures should have been added' do
    scenario '-> should display a prompt to add a picture' do
      visit('/posts')
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'pictures have been added' do
    scenario '-> pictures should be displayed' do
      signup
      click_link('Add a picture')
      fill_in('Description', with: 'Great Leader')
      attach_file 'post[image]', Rails.root.join('spec','fixtures','kimj.png')
      click_button('Create Post')
      expect(page).to have_css("img[src*='kimj.png']")
      expect(page).to have_content 'Great Leader'
    end
  end

  context 'creating pictures' do
    scenario '-> users can only add pics when logged in' do
      visit('/')
      click_link('Add a picture')
      expect(current_path).to eq('/users/sign_in')
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end

end
