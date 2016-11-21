require 'rails_helper'

feature 'Posts' do

  context 'no pictures should have been added' do
    scenario '-> should display a prompt to add a picture' do
      visit('/posts')
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'pictures & descriptions have been added' do
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

  context 'creating pictures & descriptions' do
    scenario '-> users can only add pics when logged in' do
      visit('/')
      click_link('Add a picture')
      expect(current_path).to eq('/users/sign_in')
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end

  context 'editing pictures & descriptions' do
    scenario '-> users can update pictures & descriptions' do
      signup
      post_pic
      click_link('Edit picture')
      fill_in('Description', with: 'Evil Leader')
      attach_file 'post[image]', Rails.root.join('spec','fixtures','cake.png')
      click_button('Update Post')
      expect(page).to have_content 'Evil Leader'
      expect(page).to have_css("img[src*='cake.png']")
    end

    scenario ('-> only users can edit their own pictures & descriptions') do
      visit('/')
      expect(page).to_not have_link 'Edit picture'
    end

  end

  context 'deleting pictures' do
    scenario ('-> users can delete pictures') do
      signup
      post_pic
      click_link('Delete picture')
      expect(page).to_not have_css("img[src*='kimj.png']")
      expect(page).to_not have_content 'Great Leader'
    end

    scenario ('-> only users can delete their own pictures & descriptions') do
      visit('/')
      expect(page).to_not have_link 'Delete picture'
    end

  end

end
