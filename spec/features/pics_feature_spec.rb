require 'rails_helper'

describe 'Pictures are shown on the homepage' do
  scenario 'it says no pictures when none have been added' do
    visit '/pics'
    expect(page).to have_content('No Moments')
  end

  context 'creating pictures' do
    scenario 'clicking on Create makes a new picture with a title' do
      visit '/pics'
      click_link 'Add a Moment!'
      fill_in 'Title', with: 'My very first picture'
      click_button 'Create Moment'
      expect(page).to have_content 'My very first picture'
    end
  end

  context 'viewing pics' do
    let!(:pic){ Pic.create(title:'moment') }
      scenario 'clicking on a posted picture takes you to the comments section' do
       visit '/pics'
       click_link 'moment'
       expect(page).to have_content 'moment'
       expect(current_path).to eq "/pics/#{pic.id}"
      end
  end

  context 'deleting pics' do
    before { Pic.create(title:'moment') }

    scenario 'deleting pictures when user clicks on the delete button' do
      sign_up
      visit '/pics'
      click_link 'Delete moment'
      expect(page).not_to have_content('moment')
      expect(page).to have_content 'Moment deleted successfully'
    end
  end

  context 'an invalid restaurant' do
    it 'does not let you submit a name that is too short' do
      visit '/'
      click_link 'Sign up'
      fill_in 'Email', with: 'Alex@alex.com'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
      click_button 'Sign up'
      expect(current_path).to eq "/"
      click_link "Add a Moment!"
      expect(current_path).to eq "/pics/new"
      fill_in 'Title', with: 'kf'
      click_button 'Create Moment'
      expect(page).not_to have_css 'h2', text: 'kf'
      expect(page).to have_content 'error'
    end
end
end
