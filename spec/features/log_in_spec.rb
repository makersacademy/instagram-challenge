require_relative 'web_helpers'

RSpec.describe 'logging in', type: :feature do
  before do
    sign_up_sam
    click_on 'Log out'
    click_on 'Log in'
  end

  scenario 'a user logs in' do
    fill_in 'email', with: 'sam@example.com'
    fill_in 'password', with: '1234icecream'
    click_on 'Log in'

    expect(page).to have_content "Sam's feed"
  end

  describe 'incorrect login information' do
    after do
      click_on 'Log in'
  
      expect(page).to have_current_path '/sessions/new'
      expect(page).to have_content 'Invalid username or password'
    end

    scenario 'a user tries to log in with an incorrect password' do
      fill_in 'email', with: 'sam@example.com'
      fill_in 'password', with: '123icecream'
    end
  
    scenario 'a user tries to log in with an incorrect email' do
      fill_in 'email', with: 'notsam@example.com'
      fill_in 'password', with: '1234icecream'
    end
  end
end
