require 'rails_helper'

RSpec.describe 'full application test' do

  xscenario "Run through main features of application" do
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:github]
    visit '/'
    click_on 'signin'
    click_on 'New Post'
    page.attach_file(Rails.root + 'spec/files/unknown.jpg')
    click_button 'Submit'
    expect(page.body).to have_content('#Frog')
    click_link 'deletepost'
    expect(page.body).to have_content('Post was successfully destroyed')
  end
end