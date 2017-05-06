require 'rails_helper'

feature 'pictures' do

    before do
      visit '/users/sign_up'
      fill_in 'email', with: 'kate@kate.com'
      fill_in 'password', with: '123456'
      fill_in 'password confirmation', with: '123456'
      click_button 'sign up'
    end

    scenario 'link for adding pictures' do
      visit '/pictures'
      expect(page).to have_link 'share a picture'
    end

    scenario 'show all pictures' do
      User.create(email: 'kate@kate.com', password: '123456', password_confirmation: '123456')
      Picture.create(caption: 'sally', user: User.first)
      visit '/pictures'
      expect(page).to have_content('sally')
    end

    scenario 'user can share a picture' do
      visit '/pictures'
      click_link 'share a picture'
      fill_in 'caption', with: 'sally'
      click_button 'share picture'
      expect(page).to have_content 'sally'
      expect(current_path).to eq '/pictures'
    end

    # scenario 'user can view picture on separate page' do
    #   Picture.create(caption: 'sally')
    #   picture = Picture.first
    #   visit '/pictures'
    #   click_link "#{picture.caption}"
    #   expect(current_path).to eq "/restaurants/#{picture.id}"
    #   expect(page).to have_content 'sally'
    # end

    scenario 'user can delete pictures' do
      User.create(email: 'kate@kate.com', password: '123456', password_confirmation: '123456')
      Picture.create(caption: 'sally', user: User.first)
      visit '/pictures'
      click_link 'delete this picture'
      expect(page).not_to have_content 'sally'
      expect(page).to have_content 'picture deleted'
    end

    scenario 'can see who posted a picture' do
      click_link 'share a picture'
      fill_in 'caption', with: 'sally'
      click_button 'share picture'
      expect(page).to have_content 'kate@kate.com'
    end

end
