# frozen_string_literal: true

feature 'Users can logout when logged in', type: :feature do
  scenario 'Users can click logout link when logged in' do
    log_in
    expect(page).to have_link('Logout')
  end

  scenario 'Users do not see logout button when not logged in' do
    visit '/'
    expect(page).to_not have_link('Logout')
  end

  scenario 'Users can complete the logout process successfully' do
    log_in
    expect(page).to have_content('Posts')
    click_link('Logout')
    expect(page).to have_content('You need to sign in or sign up before continuing')
  end
end
