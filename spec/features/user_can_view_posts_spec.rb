# frozen_string_literal: true

feature 'User Story 1 - Users can view posts', type: :feature do
  scenario 'Users see existing posts when logged in' do
    log_in
    expect(page).to have_content('Posts')
    expect(page).to have_css("img[src*='test1.jpg']")
    expect(page).to have_css("img[src*='test2.jpg']")
    expect(page).to have_css("img[src*='test3.jpg']")
  end
end
