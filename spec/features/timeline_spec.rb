require_relative '../rails_helper'
require './spec/helpers/feature_helper'

feature 'Users can sign up' do

  context 'credentials' do

    scenario 'correct' do
      sign_up
    end

    scenario 'incorrect' do
      visit '/'
      click_link 'Sign Up'
      fill_in 'user_name', with: ''
      fill_in 'user_email', with: 'realemample.com'
      fill_in 'user_password', with: 'secret123'
      fill_in 'user_password_confirmation', with: 'secret124'
      click_button 'Sign up!'
      expect(page).to have_content 'Current User Count: 0'
      expect(page).to have_content 'Password confirmation doesn\'t match'
      expect(page).to have_content 'Name can\'t be blank'
      expect(page).to have_content 'Email is invalid'
      expect(current_path).to eq users_path
    end

  end

end

feature 'Signing in' do

  context 'registration' do

  let(:user) { User.create(name: 'Real User', email: 'realuser@example.com', password: 'secret123') }

    scenario 'complete' do
      visit '/'
      click_link 'Sign In'
        expect {
        fill_in 'email', with: user.email
        fill_in 'password', with: user.password
        click_button 'Sign in!'
        expect(page).to have_content "Welcome #{user.name} you are now signed in!"
      }.to change { User.count }.by +1
      expect(current_path).to eq root_path
    end

    scenario 'incomplete' do
      visit '/'
      click_link 'Sign In'
      expect {
        fill_in 'email', with: 'Another Real User'
        fill_in 'password', with: 'secret124'
        click_button 'Sign in!'
        expect(page).to have_content "Your details were not recognized please try again"
      }.not_to change { User.count }
      expect(current_path).to eq sessions_path
    end

  end

end
