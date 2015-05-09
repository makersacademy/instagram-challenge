require 'rails_helper'

def sign_up
  visit '/'
  click_link 'Join in'
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: 'testtest'
  fill_in 'Password confirmation', with: 'testtest'
  click_button 'Join in'
end

def sign_up_and_add_msg
  sign_up
  visit '/photos'
  click_link 'Add Photo'
  fill_in 'Message', with: 'My first post'
  click_button 'Add my photo'
end

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display prompt to add a photo' do
      sign_up
      visit '/photos'
      expect(page).to have_content 'No ham makes us cry! Click here to add the first photo:'
      expect(page).to have_link 'Add Photo'
    end
  end

  context 'Authorisation' do
    scenario 'signed up user can add a message' do
      sign_up
      visit '/photos'
      click_link 'Add Photo'
      fill_in 'Message', with: 'My first post'
      click_button 'Add my photo'
      expect(current_path).to eq '/photos'
      expect(page).to have_content 'My first post'
    end

    scenario 'unknown user cannot add a message' do
      visit '/photos'
      expect(page).not_to have_content 'Add Photo'
      visit '/photos/new'
      expect(page).not_to have_button 'Add my photo'
      expect(page).to have_content 'Please sign in to add your ham!'
      expect(current_path).to eq '/users/sign_in'
    end

    scenario 'photo belongs to a user' do
      sign_up
      visit '/photos'
      click_link 'Add Photo'
      fill_in 'Message', with: 'My first post'
      click_button 'Add my photo'
      user = User.find_by_email('test@test.com')
      expect(user.photos.length).to eq 1
    end
  end

  context 'must have correct content' do
    scenario 'validates photo has a user_id' do
      photo = Photo.new(message: 'first')
      expect(photo.invalid?).to eq true
    end

    scenario 'validates photo has a message of more than 2 chars' do
      photo = Photo.new(user_id: 1, message: '12')
      expect(photo.invalid?).to eq true
    end

    scenario 'validates photo has a message of more than 2 chars' do
      photo = Photo.new(user_id: 1, message: '123')
      expect(photo.valid?).to eq true
    end

  end
end