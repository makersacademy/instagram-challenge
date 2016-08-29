require 'rails_helper'

feature 'pictures' do
  context 'when logged in' do

    before do
      sign_up
    end

    scenario 'user can see ther pictures and upload more' do
      click_button('Add picture')
      fill_in("Caption", with: "Me and my hat")
      page.attach_file("picture_image", Rails.root + 'app/assets/images/robinahat.jpg')
      click_button('Create Picture')
      expect(page).to have_content("Me and my hat")
    end
  end
end



def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'password')
  fill_in('Password confirmation', with: 'password')
  click_button('Sign up')
end
