require 'rails_helper'

feature 'Likes' do
  before do
    sign_up('adowellphoto@gmail.com', 'password')
    upload_image('One of my favorites', true)
  end
  context 'Singular likes' do
    scenario 'I can like an upload' do
      visit '/'
      expect(page).to have_content('0 Likes')
      click_link('Like')
      expect(page).to have_content('1 Like')
    end
    scenario 'I can only like one upload' do
      visit '/'
      click_link('Like')
      click_link('Like')
      expect(page).to have_content('1 Like')
    end
  end

  context 'Multiple likes' do
    scenario 'I can have more than one like on an upload from two different accounts' do
      visit '/'
      click_link('Like')
      sign_out
      sign_up('testing@testing.com', 'password')
      visit '/'
      click_link('Like')
      expect(page).to have_content('2 Likes')
    end
  end
end