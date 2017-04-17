require 'rails_helper'

feature 'pictures' do

  before do
  visit ('/')
  click_link('Sign up')
  fill_in("Email", with: 'test@example.com')
  fill_in("Password", with: '12345678')
  fill_in("Password confirmation", with: '12345678')
  click_button('Sign up')
  end

  context 'no pictures have been added'do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add picture'
    end
  end

  context 'add a picture' do
    scenario 'display picture caption' do
      visit '/pictures'
      click_link 'Add picture'
      fill_in 'Caption', with: 'first picture'
      click_button 'Create Picture'
      expect(page).to have_content 'first picture'
      expect(current_path).to eq '/pictures'
    end
  end

  scenario 'display pictures that has been uploaded' do
    visit '/'
    click_link 'Add picture'
    attach_file "Image", Rails.root.join('spec/features/uploads/panda.jpg')
    click_button 'Create Picture'
    expect(current_path).to eq '/pictures'
    expect(page).to have_css "img[src*='panda.jpg']"
  end
end
