require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a photos' do
      visit '/photos'
      expect(page).to have_content 'No photos yet!'
      expect(page).to have_link 'Add a photo'
    end
  end


context 'photos have been added' do
  before do
    Photo.create(caption: 'NYC')
  end

  scenario 'display photos' do
    visit '/photos'
    expect(page).to have_content('NYC')
    expect(page).not_to have_content('No photos yet')
  end
end

context 'adding photos' do
  scenario 'prompts user to fill out a form, then displays the new photo' do
    visit '/photos'
    click_link 'Sign up'
    fill_in 'Email', with: 'steve@email.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_button 'Sign up'
    visit '/photos'
    click_link 'Add a photo'
    fill_in 'Caption', with: 'NYC'
    click_button 'Create Photo'
    expect(page).to have_content 'NYC'
    expect(current_path).to eq '/photos'
  end
end

context 'viewing photos' do

  let!(:nyc){Photo.create(caption:'NYC')}

  scenario 'lets a user view a photo' do
    visit '/photos'
    click_link 'Sign up'
    fill_in 'Email', with: 'steve@email.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_button 'Sign up'
   visit '/photos'
   click_link 'NYC'
   expect(page).to have_content 'NYC'
   expect(current_path).to eq "/photos/#{nyc.id}"
  end

end

context 'editing captions' do

  before { Photo.create caption: 'NYC' }

  scenario 'let a user edit a caption' do
    visit '/photos'
    click_link 'Sign up'
    fill_in 'Email', with: 'steve@email.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_button 'Sign up'
   visit '/photos'
   click_link 'Edit Caption'
   fill_in 'Caption', with: 'New York City'
   click_button 'Update Photo'
   expect(page).to have_content 'New York City'
   expect(current_path).to eq '/photos'
  end

end


context 'deleting photos' do

  before {Photo.create caption: 'NYC'}

  scenario 'removes a photo when a user clicks a delete link' do
    visit '/photos'
    click_link 'Sign up'
    fill_in 'Email', with: 'steve@email.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_button 'Sign up'
    visit '/photos'
    click_link 'Delete NYC'
    expect(page).not_to have_content 'NYC'
    expect(page).to have_content 'Photo deleted successfully'
  end

end
end
