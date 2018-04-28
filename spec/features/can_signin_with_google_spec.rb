# Tests that a user can sign in with google (using omniauth + oauth2)
RSpec.describe 'Experience', type: :feature do
  scenario 'Can sign in with google' do
    # Turn on 'test mode' for Omniauth
    OmniAuth.config.test_mode = true
    # Mock google authentification hash for integration testing
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(provider: "google_oauth2",
      uid: "123456789",
      password: "testpassword",
      info: {
        username: "Miss Test",
        email: "test@email.com"
      })
    sign_in_with_google_oauth
    expect(page).to have_link("NEW MOMENT")
  end

  scenario "Sign in with google failure" do
    # Turn on 'test mode' for Omniauth
    OmniAuth.config.test_mode = true
    # Mock google authentification hash with invalid credentials
    OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials
    sign_in_with_google_oauth
    expect(page).to have_content("Could not authenticate you from GoogleOauth2")
  end
end
