require 'rails_helper'

feature 'Creating a new user works' do
  background do
    visit '/'
    click_link 'Register'
  end

  scenario 'via Register link in navbar,' do
    fill_in 'User name', with: 'johndoe'
    fill_in 'Email', with: 'johndoe@internet.com'
    fill_in 'Password', with: 'testtest', match: :first
    fill_in 'Password confirmation', with: 'testtest'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'and username is compulsory,' do
    fill_in 'Email', with: 'johndoe@internet.com'
    fill_in 'Password', with: 'testtest', match: :first
    fill_in 'Password confirmation', with: 'testtest'
    click_button 'Sign up'
    expect(page).to have_content('can\'t be blank')
  end

  scenario 'at least 4 characters long,' do
    fill_in 'User name', with: 'me'
    fill_in 'Email', with: 'johndoe@internet.com'
    fill_in 'Password', with: 'testtest', match: :first
    fill_in 'Password confirmation', with: 'testtest'
    click_button 'Sign up'
    expect(page).to have_content('minimum is 4 characters')
  end

  scenario 'and no more than 16 characters long.' do
    fill_in 'User name', with: 'ayahuascaisprettycool'
    fill_in 'Email', with: 'johndoe@internet.com'
    fill_in 'Password', with: 'testtest', match: :first
    fill_in 'Password confirmation', with: 'testtest'
    click_button 'Sign up'
    expect(page).to have_content("maximum is 16 characters")
  end
end
