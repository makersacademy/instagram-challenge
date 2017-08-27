require 'rails_helper.rb'

feature 'Creating session' do
  let!(:user) { create(:user) }

  scenario 'User can log in' do
    visit '/'
    within(:css, 'form.login') do
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log in'
    end
    expect(page).to have_content('Signed in successfully.')
  end
end
