require 'rails_helper'

feature 'travelgram' do
  before do
    User.create(email: "user@name.com", password: 'password', password_confirmation: 'password')
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: "user@name.com"
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/travelgrams'
      expect(page).to have_content 'Start posting!'
      expect(page).to have_link 'Share Adventure'
    end
  end

  context 'adventures have been added' do
    before do
      user = User.first
      user.travelgrams.create(name: 'Bali trip')
    end

    scenario 'Display adventures' do
      visit '/travelgrams'
      expect(page).to have_content('Bali trip')
      expect(page).not_to have_content('Start posting!')
    end
  end

  context 'creating adventures' do
    scenario 'prompts user to fill out a form, then displays new adventure' do
      visit '/travelgrams'
      click_link 'Share Adventure'
      fill_in 'Name', with: 'Bali trip'
      click_button 'Share'
      expect(page).to have_content 'Bali trip'
      expect(current_path).to eq '/travelgrams'
    end

    context 'an invalid adventure' do
      scenario 'does not let you submit a name that is too short' do
        visit 'travelgrams'
        click_link 'Share Adventure'
        fill_in 'Name', with: 'Ba'
        click_button 'Share'
        expect(page).not_to have_css 'h2', text: 'Ba'
        expect(page).to have_content 'error'
      end
    end
  end

  context 'viewing adventures' do
    before do
      user = User.first
      user.travelgrams.create(name: 'Bali trip')
    end

    scenario 'lets a user view an adventure' do
      visit '/travelgrams'
      click_link 'Bali'
      expect(page).to have_content 'Bali'
      expect(current_path).to eq "/travelgrams/#{Travelgram.last.id}"
    end
  end

  context 'editing adventures' do
    before do
      user = User.first
      user.travelgrams.create(name: 'Bali trip')
    end

    scenario 'let a user edit an adventure' do
      visit '/travelgrams'
      click_link 'Edit Bali'
      fill_in 'Name', with: 'Bali trip'
      fill_in 'Description', with: 'Loved it'
      click_button 'Update adventure'
      click_link 'Bali trip'
      expect(page).to have_content 'Bali trip'
      expect(page).to have_content 'Loved it'
      expect(current_path).to eq "/#{Travelgram.last.id}"
    end
  end

  context 'deleting adventures' do
    before do
      user = User.first
      user.travelgrams.create(name: 'Bali trip')
    end

    scenario 'removes an adventure when a user clicks a delete link' do
      visit 'travelgrams'
      click_link 'Delete Bali'
      expect(page).not_to have_content 'Bali'
      expect(page).to have_content 'Adventure deleted successfully'
    end
  end
end