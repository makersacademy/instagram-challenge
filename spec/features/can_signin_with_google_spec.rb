# Tests that a user can sign in with google (using omniauth + oauth2)
RSpec.describe 'Experience', type: :feature do
  scenario 'Can sign in with goodle' do
    sign_in_with_google_oauth
    expect(page).to have_link("NEW MOMENT")
  end
end
