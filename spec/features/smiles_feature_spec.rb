require 'rails_helper'

feature 'smiling at photos' do
  before do
    visit '/users/sign_up'
    fill_in 'Username', with: 'MagicalInternationalWoodlouse'
    fill_in 'Email', with: 'fake@fakeemail.com'
    fill_in 'Password', with: 'secretone'
    fill_in 'Password confirmation', with: 'secretone'
    click_button 'Sign up'
    visit '/photos'
    click_link 'Add a photo'
    fill_in 'Description', with: "Nando's 4 lyf"
    attach_file "photo[image]", 'spec/fixtures/files/images/MeAndMe.png'
    click_button 'Submit Photo'
    click_link 'Logout'
    visit '/users/sign_up'
    fill_in 'Username', with: 'UnintentionallyIronicTshirt'
    fill_in 'Email', with: 'anotherfake@fakeemail.com'
    fill_in 'Password', with: 'secretone'
    fill_in 'Password confirmation', with: 'secretone'
    click_button 'Sign up'
  end
  scenario 'No likes' do
    expect(page).to have_content 0
    expect(page).to have_selector '.smiles__img--indifferent'
  end
  scenario 'Like a photo' do
    find('.smiles__img').click
    expect(page).to have_content 1
    expect(page).to have_selector '.smiles__img--smile'
  end
end