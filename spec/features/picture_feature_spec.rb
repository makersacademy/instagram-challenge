require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'picture caption have been added' do
    before do
      Picture.create(caption: 'holiday snap')
    end

    scenario 'display captions' do
      visit '/pictures'
      expect(page).to have_content('holiday snap')
      expect(page).not_to have_content('No pictures yet')
    end
  end

  before do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'randomness'
    fill_in 'Password confirmation', with: 'randomness'
    click_button 'Sign up'
  end

  context 'creating picture captions' do
    scenario 'prompts user to fill out a form, then displays the new picture caption' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Caption', with: 'holiday snap'
      click_button 'Create Picture'
      expect(page).to have_content 'holiday snap'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'editing pictures' do

    before {Picture.create caption: 'holiday snap'}

    scenario 'uploads picture with caption' do
     visit '/'
     click_link 'Add a picture'
     fill_in 'Caption', with: 'holiday snap'
     page.attach_file('picture[image]', Rails.root + 'spec/support/image.png')
     click_button 'Create Picture'
     expect(page).to have_xpath("//img[contains(@src,'image.png')]")
    end

    scenario 'let a user edit a picture caption' do
     visit '/pictures'
     click_link 'Edit holiday snap'
     fill_in 'Caption', with: 'birthday snap'
     click_button 'Update Picture'
     expect(page).to have_content 'birthday snap'
     expect(current_path).to eq '/pictures'
    end
  end

end
