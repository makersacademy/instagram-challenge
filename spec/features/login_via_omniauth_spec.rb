require 'rails_helper'

RSpec.describe "Home page" do
  scenario "When not logged in the root is the login page" do
    visit '/'
    expect(page).to have_content("Sign in to AInstagram")
  end

  scenario "When logged in the root is the posts page" do
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:github]
    visit '/'
    click_on 'signin'
    expect(page).to have_content("New Post")
  end
end