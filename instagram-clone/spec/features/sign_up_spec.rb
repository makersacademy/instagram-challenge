require_relative 'web_helpers'

RSpec.describe 'signing up', type: :feature do
  scenario 'a user signs up' do
    sign_up_sam

    expect(page).to have_content "Sam's feed"
  end

  describe 'invalid sign up' do
    before do
      visit '/'
      click_on 'Sign up'
      fill_in 'first_name', with: 'Sam'
      fill_in 'last_name', with: 'Folo'
    end

    scenario 'a user fails to confirm their password' do
      fill_in 'email', with: 'sam@example.com'
      fill_in 'password', with: '1234icecream'
      fill_in 'password_confirmation', with: '1234noticecream'
      click_on 'Submit'

      expect(page).to have_content 'Invalid credentials, please try again'
    end

    scenario 'a user fails to enter a valid email' do
      fill_in 'email', with: 'sam@@example...com'
      fill_in 'password', with: '1234icecream'
      fill_in 'password_confirmation', with: '1234icecream'
      click_on 'Submit'

      expect(page).to have_content 'Invalid credentials, please try again'
    end

    scenario 'a user tries to use an email already in use' do
      fill_in 'email', with: 'sam@example.com'
      fill_in 'password', with: '1234icecream'
      fill_in 'password_confirmation', with: '1234icecream'
      click_on 'Submit'
      click_on 'Log out'

      sign_up_sam

      expect(page).to have_content 'The email sam@example.com is already in use'
    end
  end

  scenario 'a user fails to fill in all fields' do
    visit '/'
    click_on 'Sign up'
    fill_in 'first_name', with: 'Sam'
    fill_in 'email', with: 'sam@example.com'
    fill_in 'password', with: '1234icecream'
    fill_in 'password_confirmation', with: '1234icecream'
    click_on 'Submit'

    expect(page).to have_content 'Join Pinstagram'
  end
end
